# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.8.0
pkgrel=1
pkgdesc="Build system for firmware images for several open source firmware solutions"
url="https://github.com/9elements/firmware-action"
arch=(x86_64)
license=(MIT)
makedepends=(
	'go'
	'upx'
)
depends=(
	'docker'
	'dagger'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6b240689697983532c4c9aeb4c1da11270352e46be507bc0f6b303c501e1c202')

build() {
	cd "${pkgname}-${pkgver}/action"
	go build -ldflags="-s -w" -o "${pkgname}"
	upx -9 "${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

