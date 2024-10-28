# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=0.9.0
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja' 'cargo')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea64ace6c65a1de673c6d05d369d444256a2ee4fa5bde808976312ec4eb0be73')

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
