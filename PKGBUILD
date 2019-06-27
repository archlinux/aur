# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli
pkgver=2.0.0
pkgrel=2
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://github.com/writeas/writeas-cli/archive/v${pkgver}.tar.gz")
sha256sums=('9f3838a78915861cf367b2d80d0e4d63bba74e0c58bdab53f55838a1646ad3f7')

build() {
	cd ${pkgname}-${pkgver}
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags=${LDFLAGS}" \
		./cmd/writeas/
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/writeas" "${pkgdir}/usr/bin/writeas"
}
