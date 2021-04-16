# Maintainer: Simon Wilper <sxw@chronowerks.de>
# Maintainer: wicast <wicastchen@hotmail.com>

pkgname=clessc-git
pkgver=r637.4176967
pkgrel=1
pkgdesc="A C++ implementation of the LESS CSS Compiler"
arch=('x86_64')
url="https://github.com/BramvdKroef/clessc"
license=('GPLv3')
groups=()
depends=('libpng' 'libjpeg' 'google-glog')
makedepends=('git') 
provides=('clessc')
conflicts=('clessc')
replaces=('clessc')
source=("${pkgname%-git}::git+https://github.com/BramvdKroef/clessc")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir" install
}
