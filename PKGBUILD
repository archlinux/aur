# Maintainer: Nbiba bedis <bedisnbiba@gmail.com>

pkgname=fedora-firefox-wayland-bin
pkgver=64.0.2
pkgrel=2
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

source=("https://kojipkgs.fedoraproject.org//packages/firefox/$pkgver/$pkgrel.$fc/x86_64/firefox-$pkgver-$pkgrel.$fc.x86_64.rpm"
	"http://ftp.altlinux.org/pub/distributions/ALTLinux/Sisyphus/x86_64/RPMS.classic//libicu62-6.2.1-alt2.x86_64.rpm")
md5sums=('849082b98a28177bdf0adb44494453c5'
         'b4b6295d6f765877b8ba9efd345a5147')


prepare() {
  # remove a bit of fedora's custom sutff 
  rm -f usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
  # default to wayland
  sed -i -e 's:GDK_BACKEND=x11:GDK_BACKEND=wayland:' usr/bin/firefox
}

package() {
  rm -rf usr/lib
  mv usr/lib64 usr/lib
  cp  -r  usr/ $pkgdir/
}

