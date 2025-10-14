# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
pkgname=ps7_libusbtc08
pkgver=2.0.150_1r6187
pkgrel=1
pkgdesc="driver for Pico Technology PicoLog TC-08 Datalogger"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libusbtc08/"
license=('custom')
groups=()
depends=(gcc-libs bash libusb glibc)
optdepends=()
provides=()
conflicts=(ps7b_libusbtc08)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libusbtc08/libusbtc08_${pkgver//_/-}_amd64.deb")
md5sums=('e23a055b417c943fc1e214c0e57460ae')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libusbtc08/copyright"
}
