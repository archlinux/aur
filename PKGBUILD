# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Axel Navarro <navarroaxel[at]gmail[dot]com>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgname=webstorm-eap
_pkgname=WebStorm
pkgver=213.5449.31
_pkgver=2021.3
pkgrel=1
pkgdesc="JavaScript IDE and HTML editor. Early Access Program."
arch=('x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${pkgver}.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha256sums=('fd9e153bae93fb9b67ba0980ccde8cba6b4c35ca27bebec6bc116213b32c084a'
            'e8d1be7f980b7d371ef5aa65f2375397d970e887659bf3b280601cced8498e32'
            '8464fc766dbb4f6a0de4acd84007fc2916b50ca48ce7d22654144f549c8c6f4c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  rm Install-Linux-tar.txt
  rm help/ReferenceCardForMac.pdf
}


package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp --recursive ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${startdir}/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"

  ln -s "/opt/${pkgname}/bin/webstorm.sh" "${pkgdir}/usr/bin/${pkgname}"
}
