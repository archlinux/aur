# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=obs-input-overlay-bin
pkgver="v4.8"
_obsver=19.0.3
pkgrel=3
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
makedepends=(
	"unzip"
)
source=(
    "https://github.com/univrsal/input-overlay/releases/download/${pkgver}/input-overlay.${pkgver}b.linux64.zip"
)
sha256sums=('cdd1ccdd0580770ec3836b26c7d7f2ac0324ed2ddfdb4008ada0bc9ad8464358')

package() {
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/
    install -Dm755 ./plugin/bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./plugin/data/* ${pkgdir}/usr/share/obs/obs-plugins/input-overlay/
    cp -R ./presets/* ${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/
    cd ${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/
    for f in *.zip; do unzip -d "${f%*.zip}" "$f"; done
}

