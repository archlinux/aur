# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ssh-vault
pkgver=0.12.6
pkgrel=2
pkgdesc="Encrypt/Decrypt using ssh keys"
arch=('x86_64')
url='https://ssh-vault.com'
license=('BSD 3-Clause')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ssh-vault/ssh-vault/archive/${pkgver}.tar.gz")
md5sums=('8648ea5ba29409a2ffb97c3a242e4870')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}