# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
pkgname=lean4
_pkgver=4.0.0
_pkgm=m3
_pkgpver=v${_pkgver}-${_pkgm}
pkgver=${_pkgver}.${_pkgm}
pkgrel=1
pkgdesc="Lean 4 programming language and theorem prover"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/leanprover/lean4"
license=('APACHE2')
depends=('gmp')
makedepends=('cmake')
options=()
source=("${pkgname}-${pkgver}::git+https://github.com/leanprover/lean4.git#commit=${_pkgpver}")
b2sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    git submodule update --init
}

build() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake -D CMAKE_BUILD_TYPE=RELEASE ..
    make
    make stage2
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build/stage2/"
    mkdir -p "$pkgdir/usr/lib"
    cp -r bin "$pkgdir/usr/"
    cp -r share "$pkgdir/usr/"
    cp -r include "$pkgdir/usr/"
    cp -r lib/lean "$pkgdir/usr/lib/"
}
