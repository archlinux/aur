# Maintainer: Dessa Simpson <dxs@k7dxs.net>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
# Contributor: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.9.5
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
sha256sums_x86_64=('b853df82adfd7736f580692f9f734473d571606307139f8fd20c2a80dd1ff473')
sha256sums_armv7h=('17abcd85cf467c8b01afcca2e1585af443b924ac0d428b6ada65abbdebbeaaeb')
sha256sums_aarch64=('f3e159af616ec0b9bd0a405c2185cf09d06b74652c1de3c7f377e8166826651a')

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

	"${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
	"${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
	"${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
