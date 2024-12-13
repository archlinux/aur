# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: FailSpy <failspy at exonull dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner
# Contributor: tryst
# Contributor: gangelop
pkgname=pureref
_pkgname=PureRef
pkgver=2.0.3
pkgrel=3
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('LicenseRef-PureRef')
depends=('fuse2')
options=(!debug !strip)

key=$(curl -A 'AUR PKGBUILD/Please contact maintainer if there is an issue' -s https://www.pureref.com/download.php | awk '/setupPaymentSystem/,/);/' | grep -zoP '\s+"\K[A-z0-9%]+?",' | sed 's/...$//')
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&version=${pkgver}&downloadKey=$key")
b2sums=('f4705bac2c96be5f07fedec0e6190f5b41370a84a1ec59f30c2e9a47adbaa87500effb7041b36021f3db92051934ef16875a28ec94601273b336c0e670712f68')

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
