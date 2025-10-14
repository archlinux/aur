# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libps5000
pkgver=2.1.151_3r6187
pkgrel=1
pkgdesc="Library for PicoScope 5000 series in PicoScope 7"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=(ps7b_libps5000)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps5000/libps5000_${pkgver//_/-}_amd64.deb")
md5sums=('a06e12b566b71014a271db33a1dc53f1')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libps5000/copyright" 
}
