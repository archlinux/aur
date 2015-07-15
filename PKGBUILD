# Maintainer: Yiyo <vespinosa2000@yahoo.com>
pkgname=pulseaudio-equalizer-ladspa
pkgver=2.7.0.2
pkgrel=4
pkgdesc="A 15-band equalizer for PulseAudio"
arch=(i686 x86_64)
url="http://www.webupd8.org/2013/10/system-wide-pulseaudio-equalizer.html"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc')
source=(http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu/pool/main/p/pulseaudio-equalizer/pulseaudio-equalizer_$pkgver.orig.tar.gz
        pulseaudio-equalizer-2.7-do-not-crash-on-missing-preset.patch
        pulseaudio-equalizer-2.7-force-default-persistence-value.patch
        pulseaudio-equalizer-2.7-remove-preamp.patch
        pulseaudio-equalizer-2.7-window-icon.patch
        pulseaudio-equalizer-2.7-pulse-path.patch
        pulseaudio-equalizer-2.7-current-volume.patch)
md5sums=('c3c886a6017cb16408d47d0f5cd8549b'
         'ab6578d8e9528e1fc78f461a9842760d'
         '141a6d70f57938b71fb0bac0d3df9fb1'
         '0df0fa924165601f8703f13052a63456'
         '6d132c5b5d71a985fb2aa98aa93cf190'
         'abb24625bb9e2e5d77f21d8d9148cb26'
         '917b144f7789ceef42980e0b816f101d')

build() {
  cd "$srcdir/pulseaudio-equalizer"

  sed -i 's|gnome-volume-control|multimedia-volume-control|g' usr/share/applications/pulseaudio-equalizer.desktop

  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-force-default-persistence-value.patch"
  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-remove-preamp.patch"
  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-window-icon.patch"
  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-do-not-crash-on-missing-preset.patch"
  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-pulse-path.patch"
  patch -Np1 -i "$srcdir/pulseaudio-equalizer-2.7-current-volume.patch"
  
  sed -i '1s|#!/usr/bin/env python|&2|' usr/share/pulseaudio-equalizer/pulseaudio-equalizer.py
  sed -i 's|^python|&2|' usr/bin/pulseaudio-equalizer-gtk
}

package() {
  cd "$srcdir/pulseaudio-equalizer"
  cp -rfp usr "$pkgdir"
}
