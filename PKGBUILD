# Maintainer: agony <27015 at riseup dot net>

pkgname=arcane-cli-bin
pkgver=3.2.0
pkgrel=1
pkgdesc='Official command line interface for Arcane, modern Docker management (prebuilt)'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/getarcaneapp/arcane'
license=('BSD-3-Clause')
provides=("arcane-cli=${pkgver}")
conflicts=('arcane-cli')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("arcane-cli-${pkgver}-x86_64.tar.gz::${_release}/arcane-cli_linux_amd64.tar.gz")
source_aarch64=("arcane-cli-${pkgver}-aarch64.tar.gz::${_release}/arcane-cli_linux_arm64.tar.gz")
source_armv7h=("arcane-cli-${pkgver}-armv7h.tar.gz::${_release}/arcane-cli_linux_armv7.tar.gz")
source_riscv64=("arcane-cli-${pkgver}-riscv64.tar.gz::${_release}/arcane-cli_linux_riscv64.tar.gz")
sha256sums_x86_64=('527adef65cca258b29783898615d6b1d1edbebd6511c70f626456fd148895bde')
sha256sums_aarch64=('3513d28a917b1baabfa6a3e5dba4a828b871af222148008c410e94eec8c7ea49')
sha256sums_armv7h=('652066817a5aa6a0afea5ee7e15fcde685c4676dcfcd106cda560cb8be174bd8')
sha256sums_riscv64=('c36034b9385642566bbdf3738ca97ae9be3fd3f6f4f4bc06bdd7f9355e856c63')

build() {
  for shell in bash fish zsh; do
    ./arcane-cli completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 arcane-cli -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/arcane-cli"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/arcane-cli.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_arcane-cli"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
