# Maintainer: NexAdn
pkgname=obs-input-overlay-bin
pkgver="v4.8"
_obsver=19.0.3
pkgrel=1
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=(
	"obs-studio>=${_obsver}"
	"libuiohook"
)
source=(
    "https://github.com/univrsal/input-overlay/releases/download/${pkgver}/input-overlay.${pkgver}b.linux64.zip"
)
sha256sums=('0aa52c1478f6c465f8e2d05400ca03d768d650d0e41c510ed5091d6af8265d6d')

package() {
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-input-overlay/presets/
    install -Dm755 ./plugin/bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./plugin/data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-input-overlay/
    cp -R ./presets/* ${pkgdir}/usr/share/obs/obs-plugins/obs-input-overlay/presets/
    cd ${pkgdir}/usr/share/obs/obs-plugins/obs-input-overlay/presets/
    for f in *.zip; do unzip -d "${f%*.zip}" "$f"; done
}

