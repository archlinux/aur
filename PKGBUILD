# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=pulseaudio-equalizer-ladspa-ffy00-git
pkgver=1.0.r1.358553c
pkgrel=1
pkgdesc="A 15-band equalizer for PulseAudio"
arch=(any)
url="https://github.com/FFY00/pulseaudio-equalizer-ladspa"
license=('GPL3')
depends=('pygtk' 'swh-plugins' 'gnome-icon-theme' 'pulseaudio' 'bc' 'python2-gobject')
makedepends=('git')
provides=('pulseaudio-equalizer-ladspa')
conflicts=('pulseaudio-equalizer-ladspa')
source=("${pkgname%-git}::git+https://github.com/FFY00/pulseaudio-equalizer-ladspa")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  install -Dm644 "$srcdir/${pkgname%-git}/equalizerrc" "$pkgdir/usr/equalizerrc"

  cp -r "$srcdir/${pkgname%-git}/share" "$pkgdir/usr/"
  cp -r "$srcdir/${pkgname%-git}/bin" "$pkgdir/usr/"
}
