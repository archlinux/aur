# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=pulseaudio-equalizer-ladspa-git
_pkgname=${pkgname%-git}
pkgver=2.7.1.r0.358553c
pkgrel=1
pkgdesc="A 15-band equalizer for PulseAudio"
arch=(any)
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
makedepends=('git')
provides=('pulseaudio-equalizer-ladspa')
conflicts=('pulseaudio-equalizer-ladspa')
source=("git+$url"
	'ladspa_lib_path.sh')
sha256sums=('SKIP'
	    'cadad5c6257fdd3a91fa2d5caf88d23aa7e59e4cc19f25a39c3bc888994ed950')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  install -Dm644 "$srcdir"/$_pkgname/equalizerrc "$pkgdir"/usr/equalizerrc

  cp -r "$srcdir"/$_pkgname/share "$pkgdir"/usr/
  cp -r "$srcdir"/$_pkgname/bin "$pkgdir"/usr/

  mkdir -p "$pkgdir"/etc/profile.d
  cp "$srcdir"/ladspa_lib_path.sh "$pkgdir"/etc/profile.d/ladspa_lib_path.sh
}
