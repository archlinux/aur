# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli
pkgver=2.0.0
pkgrel=4
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/writeas/writeas-cli/archive/v${pkgver}-wf.tar.gz")
sha256sums=('e70e47e3ed28f26ca2ffb12723ddbdaffdea9a6a8db5a1e8a34272c1ef8511aa')

build() {
	cd ${pkgname}-${pkgver}-wf
	go build \
		-trimpath \
		-ldflags "-extldflags=${LDFLAGS}" \
		-buildmode=pie \
		./cmd/writeas/
	go build \
		-trimpath \
		-ldflags "-extldflags=${LDFLAGS}" \
		-buildmode=pie \
		./cmd/wf/
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-wf/writeas" "${pkgdir}/usr/bin/writeas"
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}-wf/wf" "${pkgdir}/usr/bin/wf"
}
