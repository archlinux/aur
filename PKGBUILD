# Maintainer: Anton Barchukov <anton@barchukov.com>
pkgname=limux-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="GPU-accelerated terminal workspace manager for Linux, powered by Ghostty's rendering engine (cmux port)"
arch=('x86_64')
url="https://github.com/am-will/limux"
license=('MIT')
depends=('gtk4' 'libadwaita' 'webkitgtk-6.0')
provides=('limux')
conflicts=('limux')
options=(!debug !strip)
source=("limux-${pkgver}.tar.gz::https://github.com/am-will/limux/releases/download/v${pkgver}/limux-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('1116ef227b5bfb61828de3b94b81cb75faf1b04b96a6cf15208622c3835931c1')

package() {
    cd "limux-${pkgver}-linux-x86_64"

    install -Dm755 limux "${pkgdir}/usr/bin/limux"
    install -Dm644 lib/libghostty.so "${pkgdir}/usr/lib/limux/libghostty.so"

    install -Dm644 /dev/stdin "${pkgdir}/etc/ld.so.conf.d/limux.conf" <<< "/usr/lib/limux"

    install -Dm644 share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 share/metainfo/*.xml -t "${pkgdir}/usr/share/metainfo/"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r share/icons/hicolor "${pkgdir}/usr/share/icons/"
    cp -r share/limux "${pkgdir}/usr/share/limux"
}
