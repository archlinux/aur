# Maintainer: Jules Pénuchot <jules@penuchot.com>

_name=ctbench
_author=jpenuchot

pkgname=${_name}-git
pkgver=v0.1.0.r58.gcbdad41
pkgrel=1
pkgdesc="Compile-time benchmark and analysis for Clang"
arch=('any')
url="https://github.com/${_author}/${_name}"
license=('MIT')

depends=('gnuplot' 'clang' 'llvm' 'llvm-libs')
makedepends=('nlohmann-json' 'sciplot')
provides=('ctbench')
conflicts=('ctbench')

source=("$pkgname::git+https://github.com/${_author}/${_name}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cmake -B build -S ${pkgname} \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
}

package() {
  make -C build DESTDIR=$pkgdir install
}
