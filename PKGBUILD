# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=0.9.1
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3af3902d73baee6a3542ff06da4ec57662f9c66175a63c9ee4e5a3e1bb0e2100')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
    CFLAGS+=" -ffat-lto-objects"
    arch-meson --buildtype release "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
