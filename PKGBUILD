# Maintainer: Kai Hendry <hendry@iki.fi>

pkgname=goredo
pkgver=1.25.0
pkgrel=1
pkgdesc="Go implementation of djb's redo, a Makefile replacement that sucks less"
url=http://www.goredo.cypherpunks.ru/
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')
provides=("redo")
conflicts=("redo")

makedepends=('git' 'go>=1.14')

validpgpkeys=('7531BB84FAF0BF35960C63B93A528DDE952C7E93')
source=("${url}/download/${pkgname}-${pkgver}.tar.zst.sig"
        "${url}/download/${pkgname}-${pkgver}.tar.zst")
# cross check with http://www.goredo.cypherpunks.ru/Install.html
sha256sums=('SKIP'
            '7044c246fcf6159d84ba7233bc25202baaa08ecccb9c30ca3c26254065eda9a4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  go build -mod=vendor -o "../dist/${pkgname}"
}

package() {
  rm -f "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # include goredo.info https://aur.archlinux.org/packages/goredo#comment-875574
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/goredo.info" "${pkgdir}/usr/share/info/goredo.info"
  cd "${pkgdir}/usr/bin/"
  ./goredo -symlinks
}
