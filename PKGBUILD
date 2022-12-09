# Maintainer: Yoan Blanc <yoan@dosimple.ch>
# Contributor: João Pinto <jpinto@ccsint.eu>
pkgname=linuxkit
pkgver=1.0.1
pkgrel=1
pkgdesc="A toolkit for building secure, portable and lean operating systems for containers"
arch=('x86_64')
url="https://github.com/linuxkit/linuxkit"
license=('APACHE')
groups=()
depends=()
checkdepends=()
makedepends=('git' 'go' 'docker' 'make')
conflicts=('linuxkit-git')
source=("https://github.com/linuxkit/linuxkit/archive/v${pkgver}.tar.gz")

sha256sums=('8a05ea89f0683852114ef312aae33ead8c65fccf6a0c13dd6d5096db972c68d1')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make VERSION=v${pkgver} bin/rtf local-build
}

#check() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#	make test
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755  bin/linuxkit "${pkgdir}/usr/bin"
	install -Dm755  bin/rtf "${pkgdir}/usr/bin"
}
