# Maintainer: Michael William Le Nguyen <michael at mail dot ttp dot codes>
pkgname=pack-cli
pkgver=0.0.9
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
	"b25028e738ef14cb1df108b8cf12a2302a4a2ec9d88c03c3ccf0638a8fef1994"
)
build() {
	cd "pack-${pkgver}"
	go build -gcflags "all=-trimpath=${PWD}" -asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags ${LDFLAGS}" ./cmd/pack
}
package() {
	install -D -m755 "pack-${pkgver}/pack" "${pkgdir}/usr/bin/pack"
}
