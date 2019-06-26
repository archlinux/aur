# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli
pkgver=2.0.0
pkgrel=1
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://github.com/writeas/writeas-cli/releases/download/v${pkgver}/writeas_${pkgver}_linux_amd64.tar.gz")
sha256sums=('994ff7ff23e0ed771fb3457775d11ad98c13116cbfa0898175486300589a35e1')

build() {
	cd ${pkgname}
	go build \
		-gcflags "all=-trimpath=${PWD}" \
		-asmflags "all=-trimpath=${PWD}" \
		-ldflags "-extldflags=${LDFLAGS}" \
		./cmd/writeas/
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/writeas" "${pkgdir}/usr/bin/writeas"
}
