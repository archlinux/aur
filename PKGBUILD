#Maintainer: Lúcio Rubens <luciorubeens@gmail.com>
_npmname=ArkClient
_appname=arkclient
pkgname=ark-desktop
pkgver=1.6.1
pkgrel=1
pkgdesc="Multi Platform Ark Lite Client"
arch=(x86_64)
url="https://github.com/ArkEcosystem/ark-desktop"
license=(MIT)
depends=('gtk2' 'alsa-lib' 'nss' 'libxtst' 'gconf' 'libxss')

source=(
  "https://github.com/ArkEcosystem/${pkgname}/releases/download/${pkgver}/${_npmname}-Linux-${pkgver}.tar.xz"
  "https://raw.githubusercontent.com/ArkEcosystem/${pkgname}/${pkgver}/LICENSE"
  "${_appname}.desktop"
  "${_appname}.svg"
)

sha1sums=(
  "5801c930f92aad34bac8bd4f58cf2d8c164ccf9a"
  "3886ec650e2912c8b0d153076ecda1d824993592"
  "e44a499a5e2e66cfd7680b4bb9e49ddbb5ff74f1"
  "9f1b28b118ee7d6071fc4d446aa018f1512406cf"
)

package() {
  cd "${srcdir}/${_npmname}-${pkgver}"

  install -d ${pkgdir}/{opt/${pkgname},usr/bin}
  cp -a * ${pkgdir}/opt/${pkgname}
  rm ${pkgdir}/opt/${pkgname}/LICENSE*
  ln -s /opt/${pkgname}/${_appname} ${pkgdir}/usr/bin/${_appname}

  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}.svg" "${pkgdir}/usr/share/pixmaps/${_appname}.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  chmod -R ugo+rX "${pkgdir}/opt"
}
