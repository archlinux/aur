# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=osu-handler
pkgdesc='Provides a handler for osu! file formats'
pkgver=0.3.0
pkgrel=1
arch=(any)
license=(GPL3)
depends=(osu-mime desktop-file-utils)
install='osu-handler.install'
source=("https://github.com/openglfreak/osu-handler-wine/archive/refs/tags/v${pkgver}.tar.gz"
        osu-file-extensions-handler.desktop)
sha256sums=('027a4cfc3f0e83d0ecd10958261c353df7d7a119895ba8c48437865ffcf88df3'
            '43f9ce9166b90f1aa47a48f0eab26131274cfaf17dcfe5964ebdb757632c95fb')

build() {
    cd "$srcdir"

    arch-meson "osu-handler-wine-${pkgver}" build -D b_ndebug=true
    meson compile -C build
}

package() {
    cd "$pkgdir"

    install -D -m755 "$srcdir/build/osu-handler-wine" 'usr/lib/osu-handler/osu-handler-wine'
    install -D -m644 "$srcdir/osu-file-extensions-handler.desktop" 'usr/share/applications/osu-file-extensions-handler.desktop'
}
