# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>
# Maintainer: Matheus <wlion@protonmail.com>

pkgname=fedora-firefox-wayland-bin
pkgver=74.0.1
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

sha256sums=('a5ba08a47ff6aa0d8ab43a01ec15b9d5bb3ed60f374e8004ecc4e96f0af1ddc1')

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

