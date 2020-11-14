# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.0.14
pkgrel=1
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=('openssl' 'ncurses' 'libxml2' 'zlib')
makedepends=('cmake' 'python' 'llvm=11.0.0' 'clang=11.0.0' 'ninja')
checkdepends=()
source=("https://github.com/trailofbits/cxx-common/archive/v${pkgver}.tar.gz")
sha256sums=('1f7c3de3fa491cfba52abd4ae5fe5cc00112309239737b89ecc8c00a9b6cb2c2')

build() {
    export TRAILOFBITS_LIBRARIES="$srcdir/libraries"
    cd "$srcdir/$pkgname-$pkgver"
    ./pkgman.py \
        --llvm_version=1100 --c_compiler=clang --cxx_compiler=clang++ \
        --repository_path="${TRAILOFBITS_LIBRARIES}" \
        --packages=cmake,z3,llvm,google,xed,capnproto
}

package() {
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/libraries" "$pkgdir/opt/$pkgname/"
    find "$pkgdir/opt/$pkgname/" -type f -exec sed -i -e "s|$srcdir|/opt/$pkgname|g" {} +
}

# vim: set sw=4 ts=4 et:
