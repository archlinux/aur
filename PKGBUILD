# Maintainer: Jon Sangster <jon@ertt.ca>
pkgname=pokerstove-git
pkgver=r134.abc20d8
pkgrel=1
pkgdesc="A highly hand optimized C++ poker hand evaluation tool"
arch=('any')
url="https://github.com/andrewprock/pokerstove"
license=('custom')
makedepends=('cmake' 'gtest' 'boost-libs')
optdepends=()
provides=('ps-eval' 'ps-colex')
source=($pkgname::git+https://github.com/andrewprock/pokerstove.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    mkdir -p src/build
    cd src/build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd $pkgname
    install -D -m755 "$srcdir/$pkgname/src/build/bin/ps-eval" "$pkgdir/usr/bin/ps-eval"
    install -D -m755 "$srcdir/$pkgname/src/build/bin/ps-colex" "$pkgdir/usr/bin/ps-colex"
    install -D -m644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
