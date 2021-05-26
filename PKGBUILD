# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=terraform13
_pkgname=terraform
pkgver=0.13.7
pkgrel=2
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha512sums=('532dce6aadef49da62f190f88fde01ea31ed04d48a8a2fbe8a9073a5574e7786abc1c131aa973ac7a15dd7d95b9ebaad720330245128e358dcbc99661c9e2404')

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
	install -Dm755 terraform-binary "$pkgdir/opt/terraform13/terraform"
}
