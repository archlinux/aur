# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=terraform-provider-stripe
pkgver=1.4.0
pkgrel=1
pkgdesc="Terraform provider for Stripe"
url="https://github.com/franckverrot/terraform-provider-stripe"
license=("MPL")
arch=("x86_64")
depends=(glibc)
makedepends=("go" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/franckverrot/terraform-provider-stripe/archive/$pkgver.tar.gz")
sha256sums=('7af24f4443f4abeadb487dbe8540de94aa9fe565748aea7a601447491f7035eb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o $pkgname
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
