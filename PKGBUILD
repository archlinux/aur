# Maintainer: Kai Hendry <hendry@iki.fi>
# http://www.goredo.cypherpunks.ru/Install.html

pkgname=goredo
pkgver=0.12.3
pkgrel=1
pkgdesc="Go implementation of djb's redo, a Makefile replacement that sucks less"
url=http://www.goredo.cypherpunks.ru/
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

makedepends=('git' 'go>=1.14')

validpgpkeys=('7531BB84FAF0BF35960C63B93A528DDE952C7E93')
source=("${url}/download/${pkgname}-${pkgver}.tar.zst.sig"
        "${url}/download/${pkgname}-${pkgver}.tar.zst")
sha256sums=('SKIP'
			'd735a27312504914ec4413abc6719c52800d5aa5defb135e871396299b2c720f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  go build -mod=vendor -o "../dist/${pkgname}"
}

package() {
  rm -f "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd "${pkgdir}/usr/bin/"
  ./goredo -symlinks
}
