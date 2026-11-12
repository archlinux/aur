# Maintainer: agony <27015 at riseup dot net>

pkgname=mesheryctl-bin
pkgver=1.0.76
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
sha256sums_x86_64=('d55e7443f404c4d3e9d8820dc6bbed459b0730583b4f9d9db3204c178995dd72')
sha256sums_aarch64=('500d3865ba738d6df4e56faff274ff4022f6bde507dc410833fea8001f719c95')
sha256sums_armv6h=('3870f79831129d1b0437cdb2112eb0d78192a0a4a0ab6e792cd2bb83e72ac496')

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
