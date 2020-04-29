# Maintainer: Mikael Tillenius <mti at tillenius dot com>
# Thanks to aAXEe <axel at brasshack dot de> and Alexandre Bique (abique)
# for earlier work.
pkgname=picoscope
pkgver=6.14.17_4r544
pkgrel=1
pkgdesc="gui for picotech oscilloscope"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(gtk-sharp-2 libpicoipp desktop-file-utils)
optdepends=('libps2000: support for picoscope 2000 series'
		'libps2000a: support for picoscope 2000 series'
        'libps3000: support for picoscope 3000 series'
        'libps5000: support for picoscope 4000 series'
        'libps5000: support for picoscope 5000 series'
        'libps5000a: support for picoscope 5000a series'
        'libps6000: support for picoscope 6000 series'
        )
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=picoscope.install
changelog=
source=(
  "http://labs.picotech.com/debian/pool/main/p/${pkgname}/${pkgname}_${pkgver//_/-}_all.deb"
  "picoscope.install"
  "95-pico.rules")
md5sums=('01ece318f722f934b62dd3623b12b896'
         '503df69f2e6001e3e9269970a552af13'
         'afedfca88c003ead013c18f26f789fd4')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  mkdir -p $pkgdir/etc/udev/rules.d/
  install -m644 95-pico.rules $pkgdir/etc/udev/rules.d/
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/picoscope/bin/picoscope $pkgdir/usr/bin/picoscope
}
