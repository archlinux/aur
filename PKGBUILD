# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>
# Maintainer: Matheus <wlion@protonmail.com>

pkgname=fedora-firefox-wayland-bin
pkgver=75.0
pkgrel=1
# fedora version
fc="fc31"
pkgdesc="Fedora's firefox build with wayland enabled by default"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=('firefox')
conflicts=('firefox')
options=(!emptydirs !strip)
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss hunspell-en_US sqlite ttf-font libpulse libvpx icu libjpeg6-turbo pipewire)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')

source=("https://kojipkgs.fedoraproject.org//packages/firefox/$pkgver/$pkgrel.$fc/x86_64/firefox-$pkgver-$pkgrel.$fc.x86_64.rpm")

sha256sums=('bc8f9820349e4816c662a8f708bef7089f59a59a5e68bf9ebc4510e2a226ad69')

prepare() {
  # remove a bit of fedora's custom sutff 
  rm -f usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
  # Enable wayland by default
  sed -i '72d;73d;75d;76d;' usr/bin/firefox
  
}

package() {
  # Avoid conflicts
  rm -rf usr/lib
  rm -rf usr/share/licenses/
  rm -rf usr/share/doc/
  
  mv usr/lib64 usr/lib
  cp  -r  usr/ $pkgdir/
}

