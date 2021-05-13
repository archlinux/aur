# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-keycloak
pkgver=3.0.1
pkgrel=1
pkgdesc="Terraform provider to configure Keycloak using it's API."
url="https://github.com/mrparkers/terraform-provider-keycloak"
arch=("x86_64")
license=("MIT")
makedepends=("go" "git")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mrparkers/terraform-provider-keycloak/archive/v$pkgver.tar.gz"
)
sha512sums=('7fdd457dada5d64d5f530fae13e9fe0adcfe35ea4c3d9cc8a55bbcbb0e34c1f12d220b67a2c9cff766a514c4ffa7043b008f9f722ef36872939d140fe39bfde9')

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