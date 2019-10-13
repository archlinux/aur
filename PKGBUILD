# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=osu-handler
pkgdesc='Provides a handler for osu! file formats'
pkgver=0.2
pkgrel=1
arch=(any)
license=(GPL3)
depends=(osu-mime desktop-file-utils)
install='osu-handler.install'
source=(git+https://github.com/openglfreak/osu-handler-wine.git
        osu-file-extensions-handler.desktop)
sha256sums=('SKIP'
            '43f9ce9166b90f1aa47a48f0eab26131274cfaf17dcfe5964ebdb757632c95fb')

build() {
    cd "$srcdir"

    arch-meson osu-handler-wine build -D b_ndebug=true

    ninja -C build
}

package() {
    cd "$pkgdir"

    install -D -m755 "$srcdir/build/osu-handler-wine" 'usr/lib/osu-handler/osu-handler-wine'
    install -D -m644 "$srcdir/osu-file-extensions-handler.desktop" 'usr/share/applications/osu-file-extensions-handler.desktop'
}
