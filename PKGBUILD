# Maintainer: agony <27015 at riseup dot net>

pkgname=mesheryctl-bin
pkgver=1.0.79
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
sha256sums_x86_64=('cbd0524ebe1d1f6c0d95c83042615b8df25f2555c7767c855d856aa69c88fb67')
sha256sums_aarch64=('9a062e398e381e7aa864850d45bd7e415898527669794f05740b82c7766e5f87')
sha256sums_armv6h=('ca9f1baa5ab1fee3928e7662464ec4c3318b7da6fb68e1e2601e5b90f70e42b6')

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
