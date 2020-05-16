# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=docker-shell
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple interactive prompt for docker"
arch=('x86_64')
url='https://github.com/Trendyol/docker-shell'
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a21a027c09da823e19e1a3b22d6356df4483b993217e5f5aa40110601ece8f07')

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