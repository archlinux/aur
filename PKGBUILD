# Maintainer: Jonathan Liu <net147@gmail.com>
# Contributor: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd-svn
_realpkgname=spacenavd
pkgver=r193
pkgrel=1
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="http://spacenav.sourceforge.net/"
conflicts=('spacenavd')
provides=('spacenavd')
license=('GPL')
depends=('bash' 'libxi')
provides=('spacenavd')
source=("svn://svn.code.sf.net/p/spacenav/code/trunk/${_realpkgname}"
        'spacenavd.service')
md5sums=('SKIP'
         'e78baefc7a59e5a4dd75cb10a08f8ba6')

pkgver() {
  cd "${_realpkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${_realpkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_realpkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/spacenavd.service" "${pkgdir}/usr/lib/systemd/system/spacenavd.service"
}
