# Maintainer: Dessa Simpson <dxs@k7dxs.net>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
# Contributor: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.9.4
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
sha256sums_x86_64=('c2c397a52930f52d2005c01d276116b059d062de379386d58e98115380a766a2')
sha256sums_armv7h=('8409a82cf082496efcc0aaabbffcc8bc958e1a626449490bbe70b154bf70d97f')
sha256sums_aarch64=('dcab945f8d8658662fa1db93e150a602ba1f91da367a82e099bd65595fc7c62c')

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

	"${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
	"${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
	"${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
