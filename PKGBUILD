# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli
pkgver=0.11.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/buildpacks/pack/archive/v0.11.2.tar.gz")
sha512sums=("80be8706959b4b04c8be95d84d27196be465f22c5aef68a81a4c8b7d3e4a2527cae8f0adbebd8df5f0df4c9ba058e5b403a7db1f55dcf572c018445561c3251e")
build() {
	export GOPATH="${srcdir}/go"
	cd "${srcdir}/pack-${pkgver}"
	PACK_VERSION="v${pkgver}" make build
}
package() {
	export GOPATH="${srcdir}/go"
	go clean -modcache
	install -D -m755 "${srcdir}/pack-${pkgver}/out/pack" "${pkgdir}/usr/bin/pack"
}
