# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.13.0
pkgrel=1
pkgdesc="Build system for firmware images for several open source firmware solutions"
url="https://github.com/9elements/firmware-action"
arch=(x86_64)
license=(MIT)
makedepends=(
	'go'
)
depends=(
	'docker'
	'dagger'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8e99b37cc9a80db85727234a514de43926a8524373dd4536cfaff158988a2305')

build() {
	cd "${pkgname}-${pkgver}/cmd/firmware-action"
	go build -ldflags="-s -w" -o "${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "cmd/firmware-action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644 "shell-completion/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 "shell-completion/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "shell-completion/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

