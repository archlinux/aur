# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>

pkgname=fedora-firefox-wayland-bin
pkgver=65.0.1
pkgrel=1
# fedora version
fc="fc29"
pkgdesc="Fedora's firefox build wtih wayland enabled by default"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=('firefox')
conflicts=('firefox')
options=(!emptydirs !strip)
makedepends=(sed)
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss hunspell-en_US sqlite ttf-font libpulse libvpx icu libjpeg6-turbo pipewire)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')

source=("https://kojipkgs.fedoraproject.org//packages/firefox/$pkgver/$pkgrel.$fc/x86_64/firefox-$pkgver-$pkgrel.$fc.x86_64.rpm")

md5sums=('b74554984b56076d4b634f69491f0a92')


prepare() {
  # remove a bit of fedora's custom sutff 
  rm -f usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
  # Enable wayland by default
  sed -i '72d;73d;75d;76d;' usr/bin/firefox
  
}

package() {
  rm -rf usr/lib
  mv usr/lib64 usr/lib
  cp  -r  usr/ $pkgdir/
}

