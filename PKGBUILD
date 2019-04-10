# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli
pkgver=0.1.0
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
	"20bdfedd8e686ad5aa076696e890834dfd9adfc9b63a94463d8c5f3187717cfe"
)
build() {
	cd "pack-${pkgver}"
	go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" ./cmd/pack
}
package() {
	install -D -m755 "pack-${pkgver}/pack" "${pkgdir}/usr/bin/pack"
}
