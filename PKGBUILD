# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# co-maintainer: Pierre-Olivier Vauboin <povauboin at gmail dot com>

pkgname=pycdc-git
pkgver=r340.fbf9d24
pkgrel=1
pkgdesc="C++ python bytecode disassembler and decompiler."
url="https://github.com/zrax/pycdc"
license=('GPL')
depends=()
makedepends=('cmake')
arch=('x86_64')
conflicts=("pycdc")
source=("$pkgname::git+https://github.com/zrax/pycdc.git")
b2sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    mkdir -p build
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/build/pycdc"
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/build/pycdas"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" ${pkgname}/LICENSE
}
