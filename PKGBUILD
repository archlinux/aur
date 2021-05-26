# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=terraform12
_pkgname=terraform
pkgver=0.12.31
pkgrel=1
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha512sums=('bb7327d317a904a05a4faa8d9a280391306c8275a4f5e9a5161a01f0bb2bc3d273e9a1b7fe30df526b07892a8225cf15bb1348573dd05e53d8c02597fd1e8ef7')

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
	install -Dm755 terraform-binary "$pkgdir/opt/terraform12/terraform"
}
