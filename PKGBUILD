# Maintainer: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=terraform13
_pkgname=terraform
pkgver=0.13.6
pkgrel=2
pkgdesc="HashiCorp tool for building and updating infrastructure as code idempotently"
url="https://www.terraform.io/"
arch=("x86_64")
license=("MPL")
makedepends=("go")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz")
sha512sums=('fdb92d26ea455d7eb12671ad869bfa216ae3a2c2d841f0b69b37c8e61d2064b0dbe1f5788919319ff76b7dae5d62cef345137c813ab93b0d42a52710ba6b9086')

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
