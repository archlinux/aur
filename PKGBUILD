# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=picoscope7
pkgver=7.1.19_1r17687
pkgrel=1
pkgdesc="PicoScope 7 Test and Measurment Stable"
arch=('x86_64')
url="https://www.picotech.com/downloads/linux"
license=('custom')
groups=()
depends=(gtk-sharp-3 ps7_libpicoipp ps7_libpicocv desktop-file-utils which)
optdepends=('ps7_libps2000: Support for PicoScope 2000 series'
		'ps7_libps2000a: Support for PicoScope 2000a series'
        'ps7_libps3000: Support for PicoScope 3000 series'
        'ps7_libps3000a: Support for PicoScope 3000a series'
        'ps7_libps4000: Support for PicoScope 4000 series'
        'ps7_libps4000a: Support for PicoScope 4000a series'
        'ps7_libps5000: Support for PicoScope 5000 series'
        'ps7_libps5000a: Support for PicoScope 5000a series'
        'ps7_libps6000: Support for PicoScope 6000 series'
        'ps7_libps6000a: Support for PicoScope 6000a series'
        )
provides=()
conflicts=(picoscope7beta)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/p/picoscope/picoscope_${pkgver//_/-}_amd64.deb")
md5sums=('9b1e6ea03f8dd7d47dfd993403c8419e')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/usr/bin
  ln -s /opt/picoscope/bin/picoscope $pkgdir/usr/bin/picoscope

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.xz -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/picoscope/copyright" 
}
