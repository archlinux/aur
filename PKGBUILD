# Maintainer: hashworks <mail@hashworks.net>
pkgname=terraformer
pkgver=0.8.7
pkgrel=1
pkgdesc="CLI tool to generate terraform files from existing infrastructure (reverse Terraform)"
license=('Apache')
arch=('x86_64')
provides=('terraformer')
url='https://github.com/GoogleCloudPlatform/terraformer'
makedepends=('go')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=("8884528c84f2b70480f16e7c8a1f79e9723671415365b2bd36d21e5142eb4746")

prepare(){
	cd "terraformer-${pkgver}"
	mkdir -p build/
}

build() {
	cd "terraformer-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build .
}

check() {
	cd "terraformer-${pkgver}"
	go test .
}

package() {
	cd "terraformer-${pkgver}"
	install -Dm755 "build/terraformer" "${pkgdir}/usr/bin/terraformer"
}

