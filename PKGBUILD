# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=0.8.5
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e59b9a607d57b6a93c856a552889929b5d8bcbb212b4e7ec24ad83a24014a3dc')

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
