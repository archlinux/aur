# Maintainer: Carsten Haitzler <raster@rasterman.com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

_pkgname=ecrire
pkgname=$_pkgname-git
pkgver=r176.4e3ff1c
pkgrel=1
epoch=1
pkgdesc="Simple text editor based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL3')
depends=('efl')
makedepends=('git' 'meson')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install=$_pkgname.install
options=('debug')
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  meson --prefix /usr --buildtype release build
  ninja -C build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "AUTHORS" "COPYING"
}

