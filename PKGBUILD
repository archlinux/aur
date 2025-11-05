# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.19.5
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
sha256sums=('6bea4056a0788b5e5d09ec899ec1ddc51dc8c7a7bbbfd3d31a45da59430ab588')

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
