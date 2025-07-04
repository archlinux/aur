# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.17.3
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
)
optdepends=(
	'dagger'
)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('cf6451bb4923afd51d6e698312a0882bc6a5663abc52142c44c2844ce5015af0')

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

	install -Dm 644 "cmd/firmware-action/kernel-modules-load.conf" "${pkgdir}/lib/modules-load.d/${pkgname}.conf"
}
