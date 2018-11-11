  # Maintainer: Nbiba bedis <bedisnbiba@gmail.com>
  
  pkgname=fedora-firefox-wayland-bin
  pkgver=63.0.1
  pkgrel=3
  pkgdesc="Fedora's firefox build wtih wayland enabled by default"
  arch=(x86_64)
  license=(MPL GPL LGPL)
  url="https://www.mozilla.org/firefox/"
  provides=('firefox')
  conflicts=('firefox')
  options=(!emptydirs !strip)
  depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
           ffmpeg nss hunspell-en_US sqlite ttf-font libpulse libvpx icu)
  optdepends=('networkmanager: Location detection via available WiFi networks'
              'libnotify: Notification integration'
              'pulseaudio: Audio support'
              'speech-dispatcher: Text-to-Speech')
  source=("https://kojipkgs.fedoraproject.org//packages/firefox/63.0.1/3.fc30/x86_64/firefox-63.0.1-3.fc30.x86_64.rpm")
  md5sums=('a4f5ef650ddb062de0a9031b79cb4979')  
  
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

