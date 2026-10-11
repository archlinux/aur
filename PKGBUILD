# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=drag
pkgver=1.1
pkgrel=1
pkgdesc='A minimal X11 drag-and-drop utility.'
url='https://codeberg.org/ayari/drag'
arch=(
    'x86_64'
    'aarch64'
)
license=('CC0-1.0')
depends=(
    'libx11'
)
makedepends=(
    'gcc'
    'make'
)
options=(!debug)
provides=('drag')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
)
sha256sums=('25d9bcb97fd30362608638b780b4f6e56b0b3edfa7c52bfc35f0eaa10b840318')

build() {
    cd "$pkgname"
    export CC="${CC:-gcc}"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 drag "${pkgdir}/usr/bin/drag"
    install -Dm644 drag.1 "${pkgdir}/usr/share/man/man1/drag.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/drag.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
