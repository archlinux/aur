
pkgname=pinegrow
pkgver=5.7
pkgrel=0
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('Pinegrow')
depends_x86_64+=(gtk2 gconf alsa-lib nss libxss libxtst gendesk)
source=("http://download.pinegrow.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf")
noextract=("Pinegrow_EULA.pdf")
sha512sums=('6a04bc6c68101f1f0af054e3acfcbf5410ab0b04a354b9896284c290d2d5e0ab62c41a77baf2077d519e984032edc23329f1b1bcc7358d6fe11e745120b0a9de'
            '75b36c2e324d6ee01aa381c28a35593d861c16a551ce3b4be35cafbdcdd17e19ee9aeb56a2032d3a22206df398cbe3b9bd1e4c7bb03db00b5362440e286b3af5')

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
