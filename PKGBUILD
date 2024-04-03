# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.2.0
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
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('668527a4122816cdcc04fef887f1644d89527df62ed73a54366adf46c3dd341d')

build() {
	cd "${srcdir}/${pkgname}/action"
	go build -ldflags="-s -w" -o "${pkgname}"
	upx -9 "${pkgname}"
}

package() {
	cd "${srcdir}"
	install -Dm 755 "${pkgname}/action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

