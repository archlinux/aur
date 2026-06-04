# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: FailSpy <failspy at exonull dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner
# Contributor: tryst
# Contributor: gangelop
pkgname=pureref
_pkgname=PureRef
pkgver=2.1.3
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('LicenseRef-PureRef')
depends=('fuse2')
options=(!debug !strip)

key=$(curl -A 'AUR PKGBUILD/Please contact maintainer if there is an issue' -s https://www.pureref.com/download.php | awk '/setupPaymentSystem/,/);/' | grep -zoP '\s+"\K[A-z0-9%]+?",' | sed 's/...$//')
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&version=${pkgver}&downloadKey=$key")
b2sums=('5b9cae3255f96df682d2bd528b38e05e76ea38e947e57a5d2245555abb0917eac79231fdb8e04830d95a66736ad7aa811c1f16a49a86e56505a9aee9e172604c')

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
