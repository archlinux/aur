# Maintainer: Schorsch <wsixcde+aur@gmail.com>
# Thanks to mti@tillenius.com whose packages the ps7b packages were based on
pkgname=picoscope7beta
pkgver=7.0.91_1r10273
pkgrel=1
pkgdesc="picoscope 7 test and measurment early access"
arch=('x86_64')
url="https://oem.picotech.com/p7beta/download"
license=('custom')
groups=()
depends=(gtk-sharp-3 ps7b_libpicoipp ps7b_libpicocv desktop-file-utils)
optdepends=('ps7b_libps2000: support for picoscope 2000 series'
		'ps7b_libps2000a: support for picoscope 2000 series'
        'ps7b_libps3000: support for picoscope 3000 series'
        'ps7b_libps3000a: support for picoscope 3000a series'
        'ps7b_libps4000: support for picoscope 4000 series'
        'ps7b_libps4000a: support for picoscope 4000a series'
        'ps7b_libps5000: support for picoscope 5000 series'
        'ps7b_libps5000a: support for picoscope 5000a series'
        'ps7b_libps6000: support for picoscope 6000 series'
        'ps7b_libps6000a: support for picoscope 6000a series'
        )
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=picoscope.install
changelog=
source=(
  "https://labs.picotech.com/rc/picoscope7/debian/pool/main/p/picoscope/picoscope_${pkgver//_/-}_amd64.deb"
  "picoscope.install"
  "95-pico.rules")
md5sums=('CE029E432ABAD4A09A449A64BECDFFE3'
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
