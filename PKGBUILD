# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=icu-svn
pkgver=r40666
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://site.icu-project.org/"
license=('custom:icu')
depends=('glibc' 'sh')
makedepends=('subversion')
provides=('icu')
conflicts=('icu')
source=("svn+http://source.icu-project.org/repos/icu/trunk/icu4c")
sha256sums=('SKIP')


pkgver() {
  cd "icu4c"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "icu4c/source"

  ./configure --prefix="/usr" --sbindir="/usr/bin" --sysconfdir="/etc"
  make
}

check() {
  cd "icu4c/source"

  make check
}

package() {
  cd "icu4c/source"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/icu4c/LICENSE" "$pkgdir/usr/share/licenses/icu/LICENSE"
}
