# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libps6000a
pkgver=2.0.161_0r193
pkgrel=1
pkgdesc="Library for PicoScope 6000a series in PicoScope 7"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps6000a/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=(ps7b_libps6000a)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libps6000a/libps6000a_${pkgver//_/-}_amd64.deb")
md5sums=('91af4d5b6a2aac0be8d793c223efcf34')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"
  
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libps6000a/copyright" 
}
