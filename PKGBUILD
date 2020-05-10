# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>

pkgname=gource-git
pkgver=0.51.r5.g06174a1
pkgrel=1
pkgdesc="software version control visualization"
license=(GPL3)
arch=(i686 x86_64)
url="https://gource.io/"
depends=(ftgl sdl2 sdl2_image pcre glew boost-libs)
makedepends=(boost glm mesa git)
source=("${pkgname%git}::git+https://github.com/acaudwell/Gource.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%git}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/gource.//'
}

prepare(){
  cd "${pkgname%git}"
  ./autogen.sh
}

build() {
  cd "${pkgname%git}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%git}"
  make DESTDIR="$pkgdir" install
}

