# Maintainer: Nicolas KAROLAK <nicolas at karolak dot fr>

pkgname=devc-bin
_pkgver=1.0.0-alpha.3
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="A CLI tool to manage your devcontainers"
arch=('x86_64')
url="https://github.com/nikaro/devc"
license=('GPL3')
depends=('docker')
optdepends=('docker-compose')
provides=("devc")
conflicts=("devc")

source=("https://github.com/nikaro/${pkgname/-bin/}/releases/download/v$_pkgver/${pkgname/-bin/}_${_pkgver}_Linux_x86_64.tar.gz")
sha256sums=("836e46df8f4ec1b28e66139a35e228aa08247501d653a6977390894b6966f144")

package() {
	install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"

	# generate completions
	SHELLS="bash zsh fish"
	for shell in ${SHELLS}; do
		"${srcdir}/${pkgname/-bin/}" completion "${shell}" > "${srcdir}/${shell}"
	done
	install -Dm644 "${srcdir}/bash" "${pkgdir}/usr/share/bash-completion/completions/devc"
	install -Dm644 "${srcdir}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_devc"
	install -Dm644 "${srcdir}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/devc.fish"
}
