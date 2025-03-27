# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.16.0
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
sha256sums=('e0dd1ab0e8c32a692577ee74b615a2e7a1521352743c709542dafd13ce7877f8')

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

