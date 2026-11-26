# Maintainer: Limux contributors
# Contributor: Anton Barchukov <anton@barchukov.com>
pkgname=limux-bin
pkgver=0.1.37
pkgrel=1
pkgdesc="GPU-accelerated terminal workspace manager for Linux, powered by Ghostty's rendering engine (cmux port)"
arch=('x86_64' 'aarch64')
url="https://github.com/am-will/limux"
license=('MIT')
depends=('fontconfig' 'glib2' 'gtk4' 'hicolor-icon-theme' 'libadwaita' 'pango' 'webkitgtk-6.0')
optdepends=('wl-clipboard: Ctrl+V paste in shells & CLI tools on Wayland')
provides=('limux')
conflicts=('limux' 'limux-debug')
options=(!debug !strip)
_release_url="https://github.com/am-will/limux/releases/download/v${pkgver}"
source_x86_64=("limux-${pkgver}-x86_64.tar.gz::${_release_url}/limux-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("limux-${pkgver}-aarch64.tar.gz::${_release_url}/limux-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('619d129b26a55080301018ac2ad390ef5ed555dbdfb14e562927bd340d14cfd6')
sha256sums_aarch64=('01ad2d54264672880042fba3529f8c3cdbb4e454308f9a617270fdbefb6ac9c8')

package() {
    cd "limux-${pkgver}-linux-${CARCH}"

    install -Dm755 limux "${pkgdir}/usr/bin/limux"
    install -Dm755 libexec/limux/limux-host "${pkgdir}/usr/libexec/limux/limux-host"
    install -Dm644 lib/libghostty-internal.so "${pkgdir}/usr/lib/limux/libghostty-internal.so"

    install -Dm644 /dev/stdin "${pkgdir}/etc/ld.so.conf.d/limux.conf" <<< "/usr/lib/limux"

    install -Dm644 share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 share/metainfo/*.xml -t "${pkgdir}/usr/share/metainfo/"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r share/icons/hicolor "${pkgdir}/usr/share/icons/"
    cp -r share/limux "${pkgdir}/usr/share/limux"
}
