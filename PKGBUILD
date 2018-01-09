#Maintainer: Lúcio Rubens <luciorubeens@gmail.com>
_npmname=ArkClient
_appname=arkclient
pkgname=ark-desktop
pkgver=1.5.0
pkgrel=1
pkgdesc="Multi Platform Ark Lite Client"
arch=(x86_64)
url="https://github.com/ArkEcosystem/ark-desktop"
license=(MIT)
depends=('nodejs' 'electron')
makedepends=('npm')

source=(
  "https://github.com/ArkEcosystem/${pkgname}/releases/download/${pkgver}/${_npmname}-Linux-${pkgver}.tar.xz"
  "https://raw.githubusercontent.com/ArkEcosystem/${pkgname}/${pkgver}/LICENSE.md"
  "${_appname}.desktop"
  "${_appname}.svg"
)

sha1sums=(
  "05cd7fd4f8ada3bcda2d8e24673dfb2b8ca33de3"
  "3886ec650e2912c8b0d153076ecda1d824993592"
  "6969963b6e3096c26d20855a7b7bbaabadc9eb1d"
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
  install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  chmod -R ugo+rX "${pkgdir}/opt"
}
