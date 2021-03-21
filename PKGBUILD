# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=terraform12
_pkgname=terraform
pkgver=0.12.30
pkgrel=1
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha512sums=('a529bbb0769ab2ec0ec0c8b0a20ce6ec8553e4f906a69462a1b54cdf9623d3a429813fc77ec9fe0b62aba759bc7420e0716d4cf22bcca39d818391f6409d40a7')

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
