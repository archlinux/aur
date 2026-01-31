# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: FailSpy <failspy at exonull dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner
# Contributor: tryst
# Contributor: gangelop
pkgname=pureref
_pkgname=PureRef
pkgver=2.1.0
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('LicenseRef-PureRef')
depends=('fuse2')
options=(!debug !strip)

key=$(curl -A 'AUR PKGBUILD/Please contact maintainer if there is an issue' -s https://www.pureref.com/download.php | awk '/setupPaymentSystem/,/);/' | grep -zoP '\s+"\K[A-z0-9%]+?",' | sed 's/...$//')
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&version=${pkgver}&downloadKey=$key")
b2sums=('0c620f064dfbe81b0f7fba5b07308027af5e637ed63dd22d19b349c7ab7362d4e123eb5afed0bdb691d6c10d6d2e5e7500a85b36e225a7515b75da852ad58e3a')

prepare(){
  ar x "${pkgname}-${pkgver}.deb"
}

package(){
  tar xf data.tar.xz -C "${pkgdir}"
  chmod -R 755 "${pkgdir}"

  bin="${pkgdir}/usr/bin/${_pkgname}"
  install -D "${bin}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
  rm "${bin}"
  ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${bin}"

  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
