# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>
pkgname=kpt-bin
pkgver=1.0.0_beta.57
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
sha256sums_aarch64=('3ea0ea9785895092c62fb42886a45bfa602fcfe4e5984f31952b690f231a5bcf')
sha256sums_x86_64=('23fe84d3584573144c8c8feb7bd4bca813797001d97548e0f3009e409c0179d5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	"${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
	install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
	if [ -f "/usr/bin/fish" ];then
		"${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
		install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
	fi
	if [ -f "/usr/bin/zsh" ];then
		"${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/${pkgname%-bin}.zsh"
		install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" -t "${pkgdir}/usr/share/zsh/site-functions"
	fi
    install -Dm644 "${srcdir}/LICENSES.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
