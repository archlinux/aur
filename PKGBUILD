# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write mermaid, svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('58accd67490e85aa4caf7eaea243801606b77b89b0084d9c9c0540d48b5d225b')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}" || exit
    sh build.sh prepare
}

build() {
    CFLAGS+=" -ffat-lto-objects"
    arch-meson --buildtype release "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
