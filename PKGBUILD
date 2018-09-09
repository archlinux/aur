# Maintainer: Florens Pauwels <mail@florens.be>
# Contributor: Lúcio Rubens <luciorubeens@gmail.com>

_npmnamev1=ArkClient
_npmname=${_npmnamev1}-V2
_appnamev1=arkclient
_appname=${_appnamev1}v2
_pkgnamev1=ark-desktop
pkgname=${_pkgnamev1}-v2

pkgver=1.6.1
pkgrel=1
pkgdesc="Multi Platform Ark Lite Client for core V2 devnet"
arch=(x86_64)
url="https://github.com/ArkEcosystem/ark-desktop"
license=(MIT)
depends=('gtk2' 'alsa-lib' 'nss' 'libxtst' 'gconf' 'libxss')

source=(
  "https://github.com/ArkEcosystem/${_pkgnamev1}/releases/download/${pkgver}/${_npmname}-Linux-${pkgver}.tar.xz"
  "https://raw.githubusercontent.com/ArkEcosystem/${_pkgnamev1}/${pkgver}/LICENSE"
  "${_appname}.desktop"
  "${_appname}.svg"
)

sha256sums=(
  "d3ea9e286fdf28759d302d91e21b42c23ccdc2d7bb6633b1f3c785421d04ec65"
  "c051061bad8e5d6783a5d631cd3efa47cc13883b97e5651be185e30fa93dcfe6"
  "b167d2faf16aa10d9bdeaafd2a397b6022a10a06ede0f76f1525142451f708d0"
  "8ca038afc96c8d1604711fd22f7fc3f75bb7004eac1090e109af843554c9a31e"
)

package() {
  cd "${srcdir}/${_npmnamev1}-${pkgver}"

  install -d ${pkgdir}/{opt/${pkgname},usr/bin}
  cp -a * ${pkgdir}/opt/${pkgname}
  rm ${pkgdir}/opt/${pkgname}/LICENSE*
  ln -s /opt/${pkgname}/${_appnamev1} ${pkgdir}/usr/bin/${_appname}

  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}.svg" "${pkgdir}/usr/share/pixmaps/${_appname}.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  chmod -R ugo+rX "${pkgdir}/opt"
}