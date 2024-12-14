# Maintainer: atomicfs

pkgname=firmware-action
pkgver=0.10.1
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
sha256sums=('e389c25fb6f82429448091739ed59d35b94755d9bb9bde1d955cf5a2bab35ae1')

build() {
	cd "${pkgname}-${pkgver}/action"
	go build -ldflags="-s -w" -o "${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm 755 "action/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm 644 "shell-completion/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm 644 "shell-completion/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
	install -Dm 644 "shell-completion/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

