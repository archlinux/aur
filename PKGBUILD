# Maintainer: Mikael Tillenius <mti at tillenius dot com>
# Thanks to aAXEe <axel at brasshack dot de> and Alexandre Bique (abique)
# for earlier work.
pkgname=picoscope
pkgver=6.12.9_4r35
pkgrel=1
pkgdesc="gui for picotech oscilloscope"
arch=('i686' 'x86_64')
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(gtk-sharp-2 libpicoipp desktop-file-utils)
optdepends=('libps3000: support for picoscope 3000 series'
		'libps2000: support for picoscope 2000 series'
		'libps2000a: support for picoscope 2000 series')
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
md5sums=('6fd874bbc4f22e5c3032fa94641533de'
         '503df69f2e6001e3e9269970a552af13'
         'afedfca88c003ead013c18f26f789fd4')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  mkdir -p $pkgdir/etc/udev/rules.d/
  install -m644 95-pico.rules $pkgdir/etc/udev/rules.d/
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/picoscope/bin/picoscope $pkgdir/usr/bin/picoscope
}
