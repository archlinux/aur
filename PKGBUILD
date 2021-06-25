# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

pkgname=osu-handler
pkgdesc='Provides a handler for osu! file formats'
pkgver=0.3.0
pkgrel=3
arch=(any)
license=(GPL3)
depends=(osu-mime glib2)
makedepends=(meson)
install='osu-handler.install'
source=("https://github.com/openglfreak/osu-handler-wine/archive/refs/tags/v${pkgver}.tar.gz"
        osu-file-extensions-handler.desktop
        osu-url-handler.desktop)
sha256sums=('027a4cfc3f0e83d0ecd10958261c353df7d7a119895ba8c48437865ffcf88df3'
            '7b2be09150e4eec5b4d74b3c393fb1bb1c2b9896cb07d8fd362233286a8040b8'
            'e5e8d5c1ff6c2e464cb61c88a7ea74b7062ba9f3b8a69e18d5313b9eec3c1e76')

build() {
    cd "$srcdir"

    arch-meson "osu-handler-wine-${pkgver}" build -D b_ndebug=true
    meson compile -C build
}

package() {
    cd "$pkgdir"

    install -D -m755 "$srcdir/build/osu-handler-wine" 'usr/lib/osu-handler/osu-handler-wine'
    install -D -m644 "$srcdir/osu-file-extensions-handler.desktop" 'usr/share/applications/osu-file-extensions-handler.desktop'
    install -D -m644 "$srcdir/osu-url-handler.desktop" 'usr/share/applications/osu-url-handler.desktop'
}
