# Maintainer: FailSpy <failspy at exonull dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner
# Contributor: tryst
# Contributor: gangelop
# Contributor: FailSpy
pkgname=pureref
pkgver=1.11.1
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('unknown')
depends=('fuse2')
makedepends=('curl' 'libarchive' 'binutils')
options=(!strip)

precursorkey=$(curl https://www.pureref.com/download.php | awk '/setupPaymentSystem/,/);/' | grep -zoP '\s+"\K[A-z0-9%]+?",' | sed 's/...$//')
key=$(curl https://www.pureref.com/expirekey.php?downloadKey=$precursorkey)
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&version=${pkgver}&downloadKey=$key")
sha512sums=('60c6ba0a35643d8e448d781093a826a1726730bf9d7e10028151831dc295d75288380c5776b283a6611be3c5547aa0355b95564cb9b8f01facba3fab34fd4a32')

prepare(){
	ar x "${pkgname}-${pkgver}.deb"
}

package(){
	tar xf data.tar.xz -C "${pkgdir}"
	chmod -R 755 "${pkgdir}"
}
