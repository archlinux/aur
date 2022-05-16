# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=docker-sbom
pkgver=0.6.0
pkgrel=1
pkgdesc="Plugin for Docker CLI to support SBOM creation using Syft"
arch=('x86_64')
url="https://github.com/docker/sbom-cli-plugin"
license=("Apache")
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docker/sbom-cli-plugin/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('290f84f6b7b847499a106f0d7f083a8a0cbd713f874d235d93c1d86821bafe2ef3c843c3c3c27d9528c1f133d79b29c67f821c7cc57f62e335fd42adafc5d2eb')

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
