# Maintainer <tianyu at vt dot edu>

pkgname=pinegrow
pkgver=3.03
pkgrel=1
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('custom')
depends_x86_64+=(gtk2 gconf alsa-lib nss libxss libxtst gendesk)
source=("http://download.pinegrow.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf")
noextract=("Pinegrow_EULA.pdf")
sha1sums=("a9b31e9a5915ef234391c84135706d1435b6310f"
          "a69404f2d55d4c8dd8d47c54dbadad9e08573e6c")
options=('!strip')
install=${pkgname}.install

prepare() {
  cd "${srcdir}"

  unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"

  cd Pinegrow-${pkgver}
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
  cd ${srcdir}
  install -D -m644 Pinegrow_EULA.pdf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -d ${pkgdir}/usr/share/pinegrow/
  cd Pinegrow-${pkgver}
  cp -R * ${pkgdir}/usr/share/pinegrow/
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
