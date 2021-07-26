# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgname=webstorm-eap
_pkgname=WebStorm
pkgver=212.4746.80
_pkgver=2021.2
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')
depends=()

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${_pkgver}.tar.gz
        webstorm-eap.sh
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha256sums=('a327ff2bd1ffac19725f148283d5b1fd6222899dc2a9795ac070ff1fc39c11f2'
            '5d71fec58a85d936a24fce93f9e95339cf276902a646da1f2982267fe926a7ed'
            'e8d1be7f980b7d371ef5aa65f2375397d970e887659bf3b280601cced8498e32'
            '8464fc766dbb4f6a0de4acd84007fc2916b50ca48ce7d22654144f549c8c6f4c')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${startdir}/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"

  # Install binary (start from symlink is broken since 211.5787.16)
  install -Dm 755 "webstorm-eap.sh" "${pkgdir}/usr/bin/${pkgname}"
}
