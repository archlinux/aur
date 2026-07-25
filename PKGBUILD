# Maintainer: Dessa Simpson <dxs@k7dxs.net>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
# Contributor: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.9.3
pkgrel=2
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
sha256sums_x86_64=('eae4e8608c0ade2bf4e8dec1669dbb6b0c28b5822b252d97feccfb4fb1181fd2')
sha256sums_armv7h=('369a812a43e42688c5b0bce5b9ebb1b0bd649f9e2c58336862cf797433d18ced')
sha256sums_aarch64=('24ec315313621bf82ea97db8a544725bc4f6de19737681f01f49c651ad3b884e')

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

	"${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
	"${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
	"${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
