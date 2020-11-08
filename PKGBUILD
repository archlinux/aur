# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-keycloak
pkgver=2.0.0
pkgrel=1
pkgdesc="Terraform provider to configure Keycloak using it's API."
url="https://github.com/mrparkers/terraform-provider-keycloak"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mrparkers/terraform-provider-keycloak/archive/v$pkgver.tar.gz"
)
sha512sums=('c8fc78a62b4502decb39aa04474def128fb0ad5c29ea23a6452053945e5092e2328aa6bc11f8196a7dca1f09e661eeb7a5bc53f5ac363e41eb8228b7e8c76171')

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname-$pkgver
  go build .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}