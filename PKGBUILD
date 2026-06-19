# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=autolock
pkgver=0.2
pkgrel=1
pkgdesc='A minimal X11 idle-watcher'
url='https://codeberg.org/ayari/autolock'
arch=(
    'x86_64'
    'aarch64'
)
license=('CC0-1.0')
depends=(
    'libx11'
    'libxss'
    'systemd-libs'
)
makedepends=(
    'gcc'
    'make'
    'patch'
)
options=(!debug)
provides=('autolock')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
    'systemd-libs.patch'
)
sha256sums=(
    '63a121df18f94ffc6e28114a32a3bb9698e2f9c4803a65e2a5d5ef927a224454'
    'a9ff995a37a5c84df46025df3ae96d2ab8b19b96968c8f1170ac7d7201210693'
)

prepare() {
    cd "$pkgname"
    patch -p1 < ../systemd-libs.patch
}

build() {
    cd "$pkgname"
    export CC="${CC:-gcc}"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 autolock "${pkgdir}/usr/bin/autolock"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=4 sw=4 et:
