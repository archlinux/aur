# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=xgo
pkgver=1.5.2
pkgrel=1
pkgdesc='The first AI-native programming language that integrates software engineering into a unified whole'
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
depends=('bash' 'glibc')
conflicts=('goplus')
replaces=('goplus')
makedepends=('go')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('68ef472acd5853f69d5378845d92619c51834a637092e2bf0924ad1cea2dd1ac')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export GOPROOT_FINAL=${pkgdir}/usr/lib/xgo
	export CGO_ENABLED=0

	go build -trimpath -o "${pkgname}" ./cmd/${pkgname}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	mkdir -p ${pkgdir}/usr/{bin,lib/xgo}
	cp -r * ${pkgdir}/usr/lib/xgo

	ln -s /usr/lib/xgo/${pkgname} ${pkgdir}/usr/bin/
}
