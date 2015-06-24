# Maintainer: Reventlov <contact+aur@volcanis.me>

pkgname=chromium-pepper-flash-standalone
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (stable version) - Standalone version"
pkgver=18.0.0.194
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
        sha1sums+=('7a244a6d7bee9e11f9cef2fac13f09a319d87d9d')
        source+=(http://docs.volcanis.me/.pepper-flash/i686/manifest.json)
        sha1sums+=('1a14231b09ae3a6513aa208df05832e660ef5526')
elif [ "$CARCH" == x86_64 ]; then
        source+=(http://docs.volcanis.me/.pepper-flash/x86_64/libpepflashplayer.so)
        sha1sums+=('7d0af496d1f91ff45bbc670f4ecb3950cecccc89')
        source+=(http://docs.volcanis.me/.pepper-flash/x86_64/manifest.json)
        sha1sums+=('13b8dacd20373a2870abd447e88bdf70d5b04b36')
fi

package() {
	install -d "${pkgdir}/etc/chromium/"
	install -d "${pkgdir}/usr/lib/PepperFlash"
	install -m644 "${srcdir}/manifest.json" "${pkgdir}/usr/lib/PepperFlash"
	install -m644 "${srcdir}/libpepflashplayer.so" "${pkgdir}/usr/lib/PepperFlash"
	sed -i "s/flashver=.*/flashver=${pkgver}/" "${startdir}/chromium-pepper-flash.install"
	install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
