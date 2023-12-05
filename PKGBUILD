# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=picoscope7beta
pkgver=7.1.18_1r17429
pkgrel=1
pkgdesc="PicoScope 7 Test and Measurment Early Access"
arch=('x86_64')
url="https://oem.picotech.com/p7beta/download"
license=('custom')
groups=()
depends=(gtk-sharp-3 ps7b_libpicoipp ps7b_libpicocv desktop-file-utils which)
optdepends=('ps7b_libps2000: Support for PicoScope 2000 series'
		'ps7b_libps2000a: Support for PicoScope 2000a series'
        'ps7b_libps3000: Support for PicoScope 3000 series'
        'ps7b_libps3000a: Support for PicoScope 3000a series'
        'ps7b_libps4000: Support for PicoScope 4000 series'
        'ps7b_libps4000a: Support for PicoScope 4000a series'
        'ps7b_libps5000: Support for PicoScope 5000 series'
        'ps7b_libps5000a: Support for PicoScope 5000a series'
        'ps7b_libps6000: Support for PicoScope 6000 series'
        'ps7b_libps6000a: Support for PicoScope 6000a series'
        )
provides=(picoscope7)
conflicts=(picoscope7)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/p/picoscope/picoscope_${pkgver//_/-}_amd64.deb")
md5sums=('711577863e69f05b5bef7c7aaf4600fe')

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
