# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for building apps using Cloud Native Buildpacks"
arch=('x86_64')
url="https://buildpacks.io/"
license=('Apache')
depends=('docker')
makedepends=('go-pie')
source=(
	"pack-${pkgver}::https://github.com/buildpack/pack/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	"345fe0e2b5e6eb8fdf08a5a4e0c9992101dc7e657f2d21389afaa52cc1d065f9"
)
build() {
	cd "pack-${pkgver}"
	go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" ./cmd/pack
}
package() {
	install -D -m755 "pack-${pkgver}/pack" "${pkgdir}/usr/bin/pack"
}
