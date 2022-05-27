# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=docker-sbom
pkgver=0.6.1
pkgrel=1
pkgdesc="Plugin for Docker CLI to support SBOM creation using Syft"
arch=('x86_64')
url="https://github.com/docker/sbom-cli-plugin"
license=("Apache")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/sbom-cli-plugin/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f2a00fa2afd23177dee8a81f1c9ea5371268d8251af0524a8fa013420e53351414bdc630dd8bf40929286aa3372381614e3a75fe7509b62c872be3a768fcf8e3')

build() {
  cd "sbom-cli-plugin-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -trimpath -buildmode=pie -mod=readonly -o sbom .
}

package() {
  cd "sbom-cli-plugin-$pkgver"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 sbom "$pkgdir"/usr/lib/docker/cli-plugins/docker-sbom
}
