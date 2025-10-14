# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libpicocv
pkgver=1.1.43_1r442
pkgrel=1
pkgdesc="Library for Pico Technology PicoScope 7 Oscilloscope Software"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicocv/"
license=('custom')
groups=()
depends=(execstack)
optdepends=()
provides=()
conflicts=(ps7b_libpicocv)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicocv/libpicocv_${pkgver//_/-}_amd64.deb")
md5sums=('5c9b5aa445f6130b449446384950b081')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libpicocv/copyright" 
}
