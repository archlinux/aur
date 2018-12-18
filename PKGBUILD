#Maintainer: Lúcio Rubens <luciorubeens@gmail.com>
_npmname=Ark.Desktop.Wallet
_appname=ark-desktop-wallet
pkgname=ark-desktop
pkgver=2.1.0
pkgrel=4
pkgdesc="Multi Platform Ark Desktop Wallet"
arch=(x86_64)
url="https://github.com/ArkEcosystem/desktop-wallet"
license=(MIT)
depends=('gtk2' 'alsa-lib' 'nss' 'libxtst' 'gconf' 'libxss')

source=(
  "https://github.com/ArkEcosystem/${pkgname}/releases/download/${pkgver}/${_npmname}-${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/ArkEcosystem/${pkgname}/${pkgver}/LICENSE"
  "${pkgname}.desktop"
  "${pkgname}.svg"
)

sha256sums=(
  "70d5dcda709caf84ddef9a82c1118755be44b72d52785aad4130e127a64d84d7"
  "d8cbf62914f8ca53cce3d6405d19f138f00fa83ba7dee8863dbb3bd741d83e85"
  "0980f1d59cbc19acbf2efc8c43649d41982ae252aab99202f1d5b5a342a87c38"
  "8ca038afc96c8d1604711fd22f7fc3f75bb7004eac1090e109af843554c9a31e"
)

package() {
  cd "${srcdir}/${_appname}-${pkgver}"

  install -d ${pkgdir}/{opt/${pkgname},usr/bin}
  cp -a * ${pkgdir}/opt/${pkgname}
  rm ${pkgdir}/opt/${pkgname}/LICENSE*
  ln -s /opt/${pkgname}/${_appname} ${pkgdir}/usr/bin/${_appname}

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_appname}.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/${_appname}/LICENSE

  chmod -R ugo+rX "${pkgdir}/opt"
}
