# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>
pkgname=kpt-bin
pkgver=1.0.0_beta.67
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
sha256sums_aarch64=('fd7cbf02bfff256037d38e98b9a20414c9ec2355e71b6544a3f4bb7ec26f7cf7')
sha256sums_x86_64=('5769ef31efb5a18a1b94e1e766443c685aabd72f9f52bfc83079e1f4b1c3d532')
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
