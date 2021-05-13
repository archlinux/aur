# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-nexus
pkgver=1.12.0
pkgrel=1
pkgdesc="Terraform provider to configure Sonatype Nexus using it's API."
url="https://github.com/datadrivers/terraform-provider-nexus"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/datadrivers/terraform-provider-nexus/archive/v$pkgver.tar.gz"
)
sha512sums=('09e40237db735e6c9eeea7bc1ac168a3902bab0d416f168f9535fd7de4cee5d9ca0ac1e2a5afa4e23cd28ae1839185199694b5b3a79d74bae90c256c8aa52867')

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname-$pkgver
  go mod tidy
  go build -v .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}