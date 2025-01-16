# Maintainer: Valerii Huz <ghotrix at gmail dot com>

pkgname=terraform1
_pkgname=terraform
pkgver=1.1.9
pkgrel=1
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('c69489c22625e94dca3e523a4da11e854523a4e5d1fa46951388eff2f5c391fef4437cb77f67acb1a5851f4a3a662640ad33cd3e6cde9853c4b7089945be8226')

build() {
	cd "$_pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o terraform-binary
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 terraform-binary "$pkgdir/opt/terraform1/terraform"
}
