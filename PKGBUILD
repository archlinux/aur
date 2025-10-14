# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libps4000
pkgver=2.1.151_2r6187
pkgrel=1
pkgdesc="Library for PicoScope 4000 series in PicoScope 7"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps4000/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=(ps7b_libps4000)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps4000/libps4000_${pkgver//_/-}_amd64.deb")
md5sums=('2f92fa69a8ec3bb4e854fe88b0c9e8ae')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libps4000/copyright" 
}
