# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli
pkgver=0.33.2
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/buildpacks/pack/archive/v0.33.2.tar.gz")
sha512sums=("3334334f16de66f7f44694f2b02fe213cea3d6100f3d414811fd3052207d7d88a22c2a9229cb640586cbf8775bf0c140d8c6fdcd8f06e28c759fd873dbf257f1")
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
