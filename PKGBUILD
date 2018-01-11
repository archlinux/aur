# Maintainer: Eric Bailey <nerflad@gmail.com>

pkgname=nyan-lang-git
pkgver=r124.92657c7
pkgrel=1
pkgdesc="A data description language designed for openage"
arch=('i686' 'x86_64')
url="https://github.com/SFTtech/nyan"
license=('LGPL3')
depends=('gcc-libs>=7.0.0')
makedepends=('cmake' 'git')
provides=('nyan-lang')
conflicts=('nyan-lang')
source=("$pkgname::git+https://github.com/SFTtech/nyan")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    mkdir -p build
}

build() {
    cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_INSTALL_LIBDIR=/usr/lib \
          -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
