# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libpicoipp
pkgver=1.4.0_4r161
pkgrel=4
pkgdesc="Library for Pico Technology PicoScope 7 Oscilloscope Software"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicoipp/"
license=('custom')
groups=()
depends=(gcc-libs execstack)
optdepends=()
provides=()
conflicts=(ps7b_libpicoipp)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicoipp/libpicoipp_${pkgver//_/-}_amd64.deb")
md5sums=('44b650f72ce91460251d160794d72a06')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libpicoipp/copyright" 
}
