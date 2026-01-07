# Maintainer: Petr Vilím <petr.vilim at proton dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7 packages were based on
pkgname=ps7_libpsospa
pkgver=1.0.158_0r5815
pkgrel=1
pkgdesc="Library for PicoScope 3000E series in PicoScope 7"
arch=('x86_64')
url="https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpsospa/"
license=('0BSD')
groups=()
depends=('libusb')
optdepends=()
provides=()
conflicts=(ps7b_libpsospa)
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/picoscope7/debian/pool/main/libp/libpsospa/libpsospa_${pkgver//_/-}_amd64.deb")
md5sums=('801c1d4c865b7df3f7bb41083376fb20')

package() {
  tar -xf data.tar.* -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir -p $pkgdir/opt/picoscope/scripts
  tar -xf control.tar.* -C "${pkgdir}/opt/picoscope/scripts" ./postinst
  mv "${pkgdir}/opt/picoscope/scripts/postinst" "${pkgdir}/opt/picoscope/scripts/${pkgname}_postinst"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/share/doc/libpsospa/copyright"
}
