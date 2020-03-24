# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=docker-shell
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple interactive prompt for docker"
arch=('x86_64')
url='https://github.com/Trendyol/docker-shell'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('98ea429384a9e65e44c526d98f90bdc3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "../docker-shell-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../docker-shell-bin "${pkgdir}/usr/bin/docker-shell"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}