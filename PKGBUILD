# Maintainer: Reventlov <contact+aur@volcanis.me>

pkgname=chromium-pepper-flash-standalone
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable version) - Standalone version"
pkgver=20.0.0.306
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=()
provides=('chromium-pepper-flash' 'pepper-flash')
conflicts=('chromium-pepper-flash-dev' 'chromium-pepper-flash')
optdepends=('pulseaudio-alsa: For PulseAudio users')
install=chromium-pepper-flash.install
source=(license.html::https://www.google.com/chrome/browser/privacy/eula_text.html)
sha1sums=('1ffba5152cb749300a016efec909b828eba9a64a')
if [ "$CARCH" == i686 ]; then
        source+=(http://docs.volcanis.me/.pepper-flash/i686/libpepflashplayer.so)
        sha1sums+=('')
        source+=(http://docs.volcanis.me/.pepper-flash/i686/manifest.json)
        sha1sums+=('')
elif [ "$CARCH" == x86_64 ]; then
        source+=(http://docs.volcanis.me/.pepper-flash/x86_64/libpepflashplayer.so)
        sha1sums+=('1f1412d0a12c76498dd8e0f67b9a11dca235c47b')
        source+=(http://docs.volcanis.me/.pepper-flash/x86_64/manifest.json)
        sha1sums+=('661608b5842622e7ca5d1d65f46dd9168c23ca15')
fi

package() {
	install -d "${pkgdir}/etc/chromium/"
	install -d "${pkgdir}/usr/lib/PepperFlash"
	install -m644 "${srcdir}/manifest.json" "${pkgdir}/usr/lib/PepperFlash"
	install -m644 "${srcdir}/libpepflashplayer.so" "${pkgdir}/usr/lib/PepperFlash"
	sed -i "s/flashver=.*/flashver=${pkgver}/" "${startdir}/chromium-pepper-flash.install"
	install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
