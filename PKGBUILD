# Maintainer:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-bin
_pkgname=alchitry-labs
pkgver=1.2.7
pkgrel=7
pkgdesc='Alchitry Labs - The Easiest Way to Program FPGAs'
arch=(x86_64)
license=('custom: commercial')
url='https://alchitry.com/pages/alchitry-labs'
provides=(alchitry-labs)
conflicts=(alchitry-labs)
depends=('java-environment>=8')
source=("$pkgname-$pkgver.tar.gz::https://cdn.alchitry.com/labs/alchitry-labs-$pkgver-linux.tgz" "${_pkgname}.desktop" "alchitry-loader.desktop")
sha256sums=("2d03956bdf432101f20fafa8fef11e882f33a71e110a4253c3f3f91a1f66653d"
            "bd74a04852e5b7aa5b4764602900cadcccf7be22579a3e8090ee04a8f723c51b"
            "65f5408ef23cad8e214a6950071edc0b99027fcbdaa726a3b3428393c570a804")

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/"{applications,icons}
  install -d "${pkgdir}/usr/bin"
  # Copy the whole SDK
  cp -a . "${pkgdir}/usr/share/${_pkgname}"

  install -m644 "${pkgdir}/usr/share/${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -m644 "${srcdir}/alchitry-loader.desktop" "${pkgdir}/usr/share/applications/alchitry-loader.desktop"
  chmod +x "${pkgdir}/usr/share/${_pkgname}/alchitry-labs"
  chmod +x "${pkgdir}/usr/share/${_pkgname}/alchitry-loader"
  ln -s "/usr/share/${_pkgname}/alchitry-labs" "${pkgdir}"/usr/bin/alchitry-labs
  ln -s "/usr/share/${_pkgname}/alchitry-loader" "${pkgdir}"/usr/bin/alchitry-loader
}
