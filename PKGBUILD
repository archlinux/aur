# Maintainer: Kai Hendry <hendry@iki.fi>

pkgname=goredo
pkgver=1.2.0
pkgrel=1
pkgdesc="Go implementation of djb's redo, a Makefile replacement that sucks less"
url=http://www.goredo.cypherpunks.ru/
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

makedepends=('git' 'go>=1.14')

validpgpkeys=('7531BB84FAF0BF35960C63B93A528DDE952C7E93')
source=("${url}/download/${pkgname}-${pkgver}.tar.zst.sig"
        "${url}/download/${pkgname}-${pkgver}.tar.zst")
# cross check with http://www.goredo.cypherpunks.ru/Install.html
sha256sums=('SKIP'
            'd0045dbaf60fb731b3db64ab262e600a3d68e487d167a0f19dd614dac6e57cd5')

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
