# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>
# Maintainer: Matheus <wlion@protonmail.com>

pkgname=fedora-firefox-wayland-bin
pkgver=84.0.2
pkgrel=1
# fedora version
fc="fc32"
pkgdesc="Fedora's firefox build with wayland enabled by default"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=('firefox=${pkgver}' 'libffi=3.1')
conflicts=('firefox' 'libffi=3.1' 'libffi=3.2')
options=(!emptydirs !strip)
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss hunspell-en_US sqlite ttf-font libpulse libvpx icu libjpeg6-turbo pipewire)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')

source=("https://kojipkgs.fedoraproject.org//packages/firefox/$pkgver/$pkgrel.$fc/x86_64/firefox-$pkgver-$pkgrel.$fc.x86_64.rpm"
	"https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Everything/x86_64/os/Packages/l/libffi-3.1-24.fc32.x86_64.rpm")

sha256sums=('b47ab5a5ef3ba642352bca2e9b4bc50893c596755cac71dbdcaf26db17c63861'
	    '86c87a4169bdf75c6d3a2f11d3a7e20b6364b2db97c74bc7eb62b1b22bc54401')

prepare() {
  # remove a bit of fedora's custom sutff 
  rm -f usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
  # Enable wayland by default
  sed -i '73d;74d;76d;77d;' usr/bin/firefox
  
}

package() {
  # Avoid conflicts
  rm -rf usr/lib
  rm -rf usr/share/licenses/
  rm -rf usr/share/doc/
  
  mv usr/lib64 usr/lib
  cp  -r  usr/ $pkgdir/
}
