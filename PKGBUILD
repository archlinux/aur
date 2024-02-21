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
sha512sums=("d416527ffbc24b2343c6b5964973a9141d028af3bb5dd7fc6b65beccff44238c4a7299c4ce970d4a529952d37c7cee15ad71e46d4b3036107526fd0ab739fcfb")
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
