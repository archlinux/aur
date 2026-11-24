# Maintainer: agony <27015 at riseup dot net>

pkgname=arcane-cli-bin
pkgver=3.1.1
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
sha256sums_x86_64=('acde64dd421f991c258dd9ef6cee4500e0ea3c1a4472b0e76ef5fbb647259d61')
sha256sums_aarch64=('b3c74b45ebfe3a729b67ad0cdfa6b6667b75a8612d7b3a2af1e62181dede4642')
sha256sums_armv7h=('3b2cad7832f797d5d404888e9b4e57b5ca08821d953564686a534f6ae8b2b9c7')
sha256sums_riscv64=('c4a82757ea2fd394f5194de84547651c81fad6b3a291e82be347da067ce59a76')

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
