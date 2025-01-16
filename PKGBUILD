# Maintainer: Valerii Huz <ghotrix at gmail dot com>

pkgname=terraform1
_pkgname=terraform
pkgver=1.0.0
pkgrel=1
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('93fd3a00b2d016d45abe1cf82acbf7065bef5c3216c36d3e04079b681aca9515f9f3a589aedff3284ee62a97f43bbbf806584f2427ed87679a0daa40502d50bd')

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
