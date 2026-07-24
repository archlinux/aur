# Maintainer: Dessa Simpson <dxs@k7dxs.net>
# Contributor: Aurel Canciu <aurelcanciu@gmail.com>
# Contributor: Hidde Beydals <hello@hidde.co>

pkgname=flux-bin
pkgver=2.9.3
pkgrel=1
_srcname=flux
_srcver=2.8.6
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
  "${pkgname}-${pkgver}_linux_amd64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_amd64.tar.gz"
)
source_armv7h=(
  "${pkgname}-${pkgver}_linux_arm.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}_linux_arm64.tar.gz::https://github.com/fluxcd/flux2/releases/download/v${_srcver}/flux_${_srcver}_linux_arm64.tar.gz"
)
sha256sums_x86_64=('c53cc990ae266f7840f64c81515d701d8821d558a9062aa4211d71b38cf044be')
sha256sums_armv7h=('be062d350dbecdcb089556f21cf397e5bd3bdd0732b0e261436b8cea6f20530c')
sha256sums_aarch64=('bc460320c2d33ad833791277896dd1aaf1cff6b3e64ba397c44238f00d4ae5bc')

package() {
	install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${_srcname}"

	"${pkgdir}/usr/bin/${_srcname}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
	"${pkgdir}/usr/bin/${_srcname}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/${_srcname}.fish"
	"${pkgdir}/usr/bin/${_srcname}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
