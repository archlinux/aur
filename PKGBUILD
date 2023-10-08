# Maintainer: Kai Hendry <hendry@iki.fi>
# Maintainer: Jan Niklas Böhm <mail@jnboehm.com>

pkgname=goredo
pkgver=2.0.0
pkgrel=1
pkgdesc="Go implementation of djb's redo, a Makefile replacement that sucks less"
url=http://www.goredo.cypherpunks.ru/
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')
provides=("redo")
conflicts=("redo")

makedepends=('git' 'go>=1.14')

validpgpkeys=('7531BB84FAF0BF35960C63B93A528DDE952C7E93')
source=("${url}/download/${pkgname}-${pkgver}.tar.zst.asc"
        "${url}/download/${pkgname}-${pkgver}.tar.zst")
# cross check with http://www.goredo.cypherpunks.ru/Install.html
sha256sums=('SKIP'
            'b914629354b87b47a3530dfe4a308e252794f8cc611e3d47cec06c8e7782f9e4')

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
