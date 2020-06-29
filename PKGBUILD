# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=terraform-provider-stripe
pkgver=1.5.0
pkgrel=1
pkgdesc="Terraform provider for Stripe"
url="https://github.com/franckverrot/terraform-provider-stripe"
license=("MPL")
arch=("x86_64")
depends=(glibc)
makedepends=("go" "git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/franckverrot/terraform-provider-stripe/archive/v$pkgver.tar.gz")
sha256sums=('535fa5338e12b4a3bff7a46f106db1cefef2725a98c396c3fbc872c120ed167f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -o $pkgname \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags ${LDFLAGS}"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
