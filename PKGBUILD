# Maintainer: Kai Hendry <hendry@iki.fi>
# http://www.goredo.cypherpunks.ru/Install.html

pkgname=goredo
pkgver=0.10.0
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
            '4b600d9948d71b029e582fcb452a7ac6df22f53867fc3c4a404091122c1c9d08')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH=`pwd`
  go build -o "dist/${pkgname}" go.cypherpunks.ru/goredo
}

package() {
  rm -f "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd "${pkgdir}/usr/bin/"
  ./goredo -symlinks
}
