# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli
pkgver=0.18.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
makedepends=('go-pie')
source=("https://github.com/buildpacks/pack/archive/v0.18.0.tar.gz")
sha512sums=("8dbe494cdee0b084ccbbdee2a83ac0cd9c2b8f9f289c6fb5a2af126e8e452fa7bf52baf61899789f2d7e2cd2e346fbd1ccf9b46897742a137559bb8a2959a8ef")
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
