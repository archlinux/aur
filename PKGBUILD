# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libps5000
pkgver=2.1.128_3r5589
pkgrel=1
pkgdesc="Library for PicoScope 5000 series in PicoScope 7 Beta"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps5000/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=(ps7_libps5000)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps5000/libps5000_${pkgver//_/-}_amd64.deb")
md5sums=('a782d6a362454d5c3cc77bea4d3bf7e9')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.xz -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libps5000/copyright" 
}
