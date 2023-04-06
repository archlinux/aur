# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=euterpe
pkgver=1.5.4
pkgrel=1
pkgdesc='Self-hosted music streaming server with RESTful API and Web interface'
arch=('x86_64')
url="https://github.com/ironsmile/$pkgname"
license=('GPL')
depends=('taglib' 'icu')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('941b7a5f99460cea23beb024bcc2e7315fe4a79563f8c750dcdf733465487eff')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
