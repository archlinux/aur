# Maintainer: Alva <a at u8 dot is>
pkgname=passphrase
pkgrel=1
pkgver=1.0.0
pkgdesc="Zero-dependency passphrase generator, written in Zig"
arch=('any')
url="https://git.sr.ht/~alva/${pkgname}"
license=('MIT')
makedepends=('zig>=0.6.0')
source=(git+https://git.sr.ht/~alva/${pkgname}#tag=1.0.0)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    zig build -Drelease-fast
}

check() {
    cd "${srcdir}/${pkgname}"
    zig build test
}

package() {
    cd "${srcdir}/${pkgname}"
    zig build install -Drelease-fast --prefix "${pkgdir}/usr"
}
