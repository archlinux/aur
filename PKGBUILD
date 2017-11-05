# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>

pkgname=gource-git
pkgver=gource.0.47.r1.gb227b93
pkgrel=1
pkgdesc="software version control visualization"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://gource.io/"
depends=('ftgl' 'sdl2' 'sdl2_image' 'pcre' 'glew' 'boost-libs')
makedepends=('boost' 'glm' 'mesa')
source=("${pkgname}::git+https://github.com/acaudwell/Gource.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${pkgname}

  sh autogen.sh
    ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}
  make DESTDIR="$pkgdir" install
}

