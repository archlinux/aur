# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
pkgname=ps7b_libusbtc08
pkgver=2.0.146_1r6147
pkgrel=1
pkgdesc="Early Access driver for Pico Technology PicoLog TC-08 Datalogger"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libusbtc08/"
license=('custom')
groups=()
depends=(gcc-libs bash libusb glibc)
optdepends=()
provides=()
conflicts=(ps7_libusbtc08)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libusbtc08/libusbtc08_${pkgver//_/-}_amd64.deb")
md5sums=('e9cefc01ce991ec7c4c4498cbed1d89f')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.xz -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libusbtc08/copyright"
}
