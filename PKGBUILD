# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=0.8.3
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('61f8ebdcc7f37ae2a0742b9d267eff7a53b9e3b9a0613e0d633b93b25bd4cc80')

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
