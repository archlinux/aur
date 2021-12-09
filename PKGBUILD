# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli
pkgver=0.23.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/buildpacks/pack/archive/v0.23.0.tar.gz")
sha512sums=("71fe75470b30bfa5580a617b48d04131760ae8f08dbdcf6efc0766dcb2f608e0fddd9d15c3bb1622cb37c7c7e8b3c4fb85d67153d10b5b7c3088e16b4224b301")
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
