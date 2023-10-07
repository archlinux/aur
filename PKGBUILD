# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libpicocv
pkgver=1.1.34_beta2r172
pkgrel=1
pkgdesc="Library for Pico Technology PicoScope 7 Oscilloscope Software"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicocv/"
license=('custom')
groups=()
depends=()
optdepends=()
provides=()
conflicts=(ps7b_libpicocv)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpicocv/libpicocv_${pkgver//_/-}_amd64.deb")
md5sums=('cfb367385259969256a95ea134fb0d4b')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.xz -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libpicocv/copyright" 
}
