# Maintainer: agony <27015 at riseup dot net>

pkgname=mesheryctl-bin
pkgver=1.0.81
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
sha256sums_x86_64=('a65741b79e75b146a05c5924f5922cf0135990085e28eb6b64272b8cca2fdfbf')
sha256sums_aarch64=('57be2202ca03957df7784133263a05e8fdd38fe085874d01b9d5c9ffa2120066')
sha256sums_armv6h=('a10570469d7dba893781c56668ad311c16e9e3017d0154777f719d2245760a6b')

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
