# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=iamy
pkgver=2.4.0
pkgrel=1
pkgdesc='A cli tool for importing and exporting AWS IAM configuration to YAML files'
arch=('x86_64')
url="https://github.com/99designs/iamy"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd $pkgname-$pkgver
  make bin/iamy-linux-amd64
}

package() {
  install -Dm755 $pkgname-$pkgver/bin/iamy-linux-amd64   "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('13bd9e66afbeb30d386aa132a4af5d2e9a231d2aadf54fe8e5dc325583379359')
