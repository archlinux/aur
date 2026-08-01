# Maintainer: TSUKUMO Akito <tsukumoakito99@duck.com>
# SPDX-License-Identifier: 0BSD

pkgname=zind
pkgver=1.0.2
pkgrel=1
pkgdesc="Dynamic structural API indexer for Zig"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/tsukumoakito/zind"
license=('MIT')
depends=('zig>=0.16.0' 'zig<0.17.0')
makedepends=('zig>=0.16.0' 'zig<0.17.0' 'scdoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tsukumoakito/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
validpgpkeys=('66B227EC5F67D7B4F8C6C1C7E98764DF6FCE8857')
sha256sums=('e32a414b658f439eaa3a66ea579a615a45d1af02336ddbb5c5ae63608a642d40')

build() {
    cd "${pkgname}-${pkgver}"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 zig-out/bin/zind "${pkgdir}/usr/bin/zind"
    install -Dm644 zig-out/share/man/man1/zind.1 "${pkgdir}/usr/share/man/man1/zind.1"
    install -Dm644 zig-out/share/man/ja/man1/zind.1 "${pkgdir}/usr/share/man/ja/man1/zind.1"
    install -Dm644 zig-out/doc/MANUAL.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
    install -Dm644 zig-out/doc/MANUAL_ja.md "${pkgdir}/usr/share/doc/${pkgname}/MANUAL_ja.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 README_ja.md "${pkgdir}/usr/share/doc/${pkgname}/README_ja.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
