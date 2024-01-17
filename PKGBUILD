# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.164.934a72f
pkgrel=1
pkgdesc="Build system for firmware images for several open source firmware solutions"
url="https://github.com/9elements/firmware-action"
arch=(x86_64)
license=(MIT)
makedepends=('go' 'upx')
depends=('docker')
#source=("${url}/archive/v${pkgver}.tar.gz")
source=("${pkgname}::git+${url}")
#sha256sums=('09738830ce17ac450bce3007def5e79da58fc19b61c37cbc83a64a2aa4b02201')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	version=$(printf "r0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)")
	echo "${version:1}"
}

build() {
	cd "${srcdir}/${pkgname}/action"
	go build -ldflags="-s -w" -o "${pkgname}"
	upx -9 "${pkgname}"
}

package() {
	cd "${srcdir}"
	install -Dm 755 "${pkgname}/action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

