# Maintainer <tianyu at vt dot edu>

pkgname=pinegrow
pkgver=3.02
pkgrel=3
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('custom')
depends_x86_64+=(gtk2 gconf alsa-lib nss libxss libxtst gendesk)
source=("http://download.pinegrow.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf")
noextract=("Pinegrow_EULA.pdf")
sha1sums=("cd6ae9e6cba2c11232ebf0d26ece4c9d3d2bf983"
          "a69404f2d55d4c8dd8d47c54dbadad9e08573e6c")
options=('!strip')
install=${pkgname}.install

prepare() {
  cd "${srcdir}"

  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc"

  unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"
}

package() {
  cd ${srcdir}
  install -D -m644 Pinegrow_EULA.pdf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  cd "Pinegrow-${pkgver}"
  install -d ${pkgdir}/usr/share/pinegrow/
  cp -R * ${pkgdir}/usr/share/pinegrow/
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
