# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: FailSpy <failspy at exonull dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner
# Contributor: tryst
# Contributor: gangelop
pkgname=pureref
_pkgname=PureRef
pkgver=2.1.1
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('LicenseRef-PureRef')
depends=('fuse2')
options=(!debug !strip)

key=$(curl -A 'AUR PKGBUILD/Please contact maintainer if there is an issue' -s https://www.pureref.com/download.php | awk '/setupPaymentSystem/,/);/' | grep -zoP '\s+"\K[A-z0-9%]+?",' | sed 's/...$//')
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&version=${pkgver}&downloadKey=$key")
b2sums=('7e3a740e16dd65705b8fc17b9ae3cbb6fce667b0f4cec1b76dba0477ce43cd1fae24c5481c7c843ab56caa9892f7b126687243675844933011b4bf1e94bc916a')

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
