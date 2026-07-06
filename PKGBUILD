# Maintainer: Anton Barchukov <anton@barchukov.com>
pkgname=limux-bin
pkgver=0.1.21
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
sha256sums=('bedfa1b224163f92310d0fe1b6510a30eb7fb1ea69141928cb3d80c227850651')

package() {
    cd "limux-${pkgver}-linux-x86_64"

    install -Dm755 limux "${pkgdir}/usr/bin/limux"
    install -Dm755 libexec/limux/limux-host "${pkgdir}/usr/libexec/limux/limux-host"
    install -Dm644 lib/libghostty.so "${pkgdir}/usr/lib/limux/libghostty.so"

    install -Dm644 /dev/stdin "${pkgdir}/etc/ld.so.conf.d/limux.conf" <<< "/usr/lib/limux"

    install -Dm644 share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"
    install -Dm644 share/metainfo/*.xml -t "${pkgdir}/usr/share/metainfo/"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -r share/icons/hicolor "${pkgdir}/usr/share/icons/"
    cp -r share/limux "${pkgdir}/usr/share/limux"
}
