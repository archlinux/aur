# Maintainer: Janek Thomaschewski <janek[at]artos-hosting[dot]de>
# Contributor: Testuser_01 <arch[at]nico-siebler[dot]de>
# Contributor: Pablo Vilas <pablovilas89[at]gmail[dot]com>

pkgname=webstorm-eap
_pkgname=WebStorm
pkgver=202.5958.22
_pkgver=2020.2
pkgrel=1
ipkgdesc="JavaScript IDE and HTML editor."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/webstorm"
license=('custom')
depends=()

source=(https://download.jetbrains.com/webstorm/${_pkgname}-${pkgver}.tar.gz
        jetbrains-webstorm-eap.desktop
        ${_pkgname}_license.txt)

sha256sums=('1ea19981bd9bb693cdd589453731540cef1f6bde49d2a92b6af8bebffafd2fad'
            'e8d1be7f980b7d371ef5aa65f2375397d970e887659bf3b280601cced8498e32'
            '8464fc766dbb4f6a0de4acd84007fc2916b50ca48ce7d22654144f549c8c6f4c')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r ${srcdir}/${_pkgname}-${pkgver}/* "${pkgdir}/opt/${pkgname}"
  if [[ $CARCH = 'i686' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier64"
  fi
  if [[ $CARCH = 'x86_64' ]]; then
    rm -f "${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so"
    rm -f "${pkgdir}/opt/${pkgname}/bin/fsnotifier"
  fi

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/bin/webstorm.sh "${pkgdir}"/usr/bin/${pkgname}
  install -m 644 "${startdir}/jetbrains-${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  install -m 644 "${pkgdir}/opt/${pkgname}/bin/webstorm.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -m 644 "${startdir}/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt"
}
