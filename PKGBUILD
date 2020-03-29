# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gomason
pkgver=2.6.4
pkgrel=1
pkgdesc="A tool for testing, building, signing, and publishing binaries"
arch=('x86_64')
url='https://github.com/nikogura/gomason'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('53453449fb61c9fc7abe920142d58fd3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  go build -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../${pkgname}-bin "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}