# Maintainer: Łukasz Dywicki <luke@code-house.org>

pkgname=terraform-provider-dynadot
pkgver=2.0.3
pkgrel=1
pkgdesc="A Terraform provider plugin to manage nameservers for domains registered with Dynadot."
url="https://github.com/codewise/terraform-provider-dynadot"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/codewise/terraform-provider-dynadot/archive/$pkgver.tar.gz"
)
sha512sums=('d2f0b985cbed34311208b28509f119c05b11720f8a09cc773fbfd6056ad8e2f78a9d2d58c71e9cb065f3b41a5862b55cbc3d9d87f56009041640f6a9754575e7')

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