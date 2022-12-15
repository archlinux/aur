# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
# Maintainer: Buildpacks Maintainers <cncf-buildpacks-maintainers at lists dot cncf dot io>
pkgname=pack-cli-git
pkgver=0.28.0+r6.g19b9f4c1
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
makedepends=(
	'git'
	'go-pie'
)
provides=('pack-cli')
conflicts=('pack-cli')
source=("${pkgname}::git+https://github.com/buildpacks/pack")
sha512sums=("SKIP")
build() {
	export GOPATH="${srcdir}/go"
	cd "${srcdir}/${pkgname}"
	PACK_VERSION=0.28.0 make build
}
package() {
	export GOPATH="${srcdir}/go"
	go clean -modcache
	install -D -m755 "${srcdir}/${pkgname}/out/pack" "${pkgdir}/usr/bin/pack"
}