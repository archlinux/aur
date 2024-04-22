# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>
pkgname=kpt-bin
pkgver=1.0.0_beta.49
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc="Automate Kubernetes Configuration Editing"
arch=(
	'aarch64'
	'x86_64'
)
url="https://kpt.dev/"
_ghurl="https://github.com/kptdev/kpt"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'diffutils'
	'docker'
	'git'
	'kubectl'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_linux_arm64-${pkgver//_/-}.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_linux_amd64-${pkgver//_/-}.tar.gz")
sha256sums_aarch64=('18dfb4540eeed32d2bdded612b3aa678cee6fdcdb14813e184c1a54b4ca35b56')
sha256sums_x86_64=('8de2996018992ea946c9002aa43c85250a78d9fa3eb1c8da24c7878d7d24b9b7')
build() {
	"${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
	"${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
	"${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/${pkgname%-bin}.zsh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
	install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSES.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}