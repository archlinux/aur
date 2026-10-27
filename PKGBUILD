# Maintainer: Dessa Simpson <dxs@k7dxs.net>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
# Contributor: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.10.0
pkgrel=1
_srcname=flux
pkgdesc="Open and extensible continuous delivery solution for Kubernetes"
url="https://fluxcd.io/"
provides=("fluxcd")
conflicts=("fluxcd")
arch=("x86_64" "armv7h" "aarch64")
license=("APACHE")
optdepends=('bash-completion: auto-completion for flux in Bash'
            'fish-completion: auto-completion for flux in Fish'
            'zsh-completions: auto-completion for flux in ZSH')
source_x86_64=(
  "${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_amd64.tar.gz"
)
source_armv7h=(
  "${pkgname}-${pkgver}_linux_arm.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${pkgver}/flux_${pkgver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=('208dd7012c04fedeed5b2d0b6e63df3b15b1c34a381527811685c098bc9f8659')
sha256sums_armv7h=('78541675c5b5c31d84dcb96d7bcecd1441d0e27e829b7ed9ca432d1459e575b2')
sha256sums_aarch64=('c3c435052e5e18156858bc73f26bcadb62821a6e30951b4b302beb4e65a532c2')

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

	"${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
	"${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
	"${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
