# Maintainer: agony <27015 at riseup dot net>

pkgname=mesheryctl-bin
pkgver=1.0.80
pkgrel=1
pkgdesc='Command line interface for the Meshery cloud native manager (prebuilt)'
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/meshery/meshery'
license=('Apache-2.0')
provides=("mesheryctl=${pkgver}")
conflicts=('mesheryctl')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/mesheryctl_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${_release}/mesheryctl_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("${_release}/mesheryctl_${pkgver}_Linux_armv6.tar.gz")
sha256sums_x86_64=('9165748546b46e4c6a1d3ad12ca1b03f20ed565147da193dfe928e271ab77348')
sha256sums_aarch64=('e0ce874c51b0a020512c6b84d859ce4eb84eb5a8a6a3484449006cc2f239738e')
sha256sums_armv6h=('21f112909be11df9720edbf3abc5f2a0b697eb36e49e59255c4095fabf81e83a')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
}

build() {
  _home_env
  for shell in bash fish zsh; do
    ./mesheryctl completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 mesheryctl -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/mesheryctl"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/mesheryctl.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_mesheryctl"
}
