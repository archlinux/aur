# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=terraform13
_pkgname=terraform
pkgver=0.13.6
pkgrel=1
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha512sums=('63368d4e30dbf66fe7f486ae7348c3eb9285386ef452a6c8c01f8e034fcc57cf647165ab38aed8e4624f00f7eb1ba0103264366bccc4513796dc36634361b22a')

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
