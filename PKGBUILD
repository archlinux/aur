pkgname=crane-gps-watch-git
_pkgname=crane_gps_watch
pkgver=20150519
pkgrel=1
pkgdesc="Linux client for Crane gps watch (from Aldi or Hofer). It reads from the watch and writes to '.tcx', Garmin Training Center file."
arch=('any')
url="https://github.com/mru00/crane_gps_watch"
source="git://github.com/mru00/crane_gps_watch.git"
license=('GPL')
depends=('libxml2')
makedepends=('git')
provides=('crane-gps-watch')
conflicts=('crane-gps-watch')
options=('!emptydirs')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package(){
  cd "$srcdir/$_pkgname"

#  CXXFLAGS="$CXXFLAGS -Wno-error=maybe-uninitialized"
#  CFLAGS="$CFLAGS -Wno-error=maybe-uninitialized"
  aclocal || return 1
  automake --add-missing || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install

#  install -d "${pkgdir}"/usr/bin
#  install -Dm755 "${srcdir}/${_pkgname}/crane_gps_watch_client" "${pkgdir}/usr/bin/crane_gps_watch_client"
}