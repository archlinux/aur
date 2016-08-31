# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0

pkgname=chromium-pepper-flash-dev
pkgver=23.0.0.141
pkgrel=1
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (Dev Channel)"
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
optdepends=('pulseaudio-alsa: For PulseAudio users')
conflicts=('chromium-pepper-flash' 'chromium-pepper-flash-stable')
provides=('chromium-pepper-flash')
options=('!emptydirs' '!strip')
source=('https://www.google.com/chrome/intl/en/eula_text.html'
        'http://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-unstable-54.0.2837.0-1.x86_64.rpm'
        )
sha1sums=('9839044035b56b5dbeb9377e27a4ea0f5a1b94e2'
          '880b51dabaf53beefee36a3ed38f18560c42a234'
          )
install=chromium-pepper-flash-dev.install
noextract=("google-chrome-unstable-54.0.2837.0-1.x86_64.rpm")

pkgver() {
  bsdtar -xf "google-chrome-unstable-54.0.2837.0-1.x86_64.rpm" opt/google/chrome*/PepperFlash
  echo "$(cat opt/google/chrome-unstable/PepperFlash/manifest.json | grep version | cut -d '"' -f4)"
}

package() {
  install -Dm644 opt/google/chrome-unstable/PepperFlash/manifest.json "${pkgdir}/usr/lib/PepperFlash/manifest.json"
  install -Dm755 opt/google/chrome-unstable/PepperFlash/libpepflashplayer.so "${pkgdir}/usr/lib/PepperFlash/libpepflashplayer.so"

  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
