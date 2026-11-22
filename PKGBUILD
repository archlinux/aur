# Maintainer: agony <27015 at riseup dot net>

pkgname=mesheryctl-bin
pkgver=1.0.83
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
sha256sums_x86_64=('891f3896c05bd732eb659aceb08336ba268b3d10144e301a01cec2f9abf1867f')
sha256sums_aarch64=('3654c1260223b75bdf8f23108d7fc611571074d8b0a5f9f9c67ab70c45418e71')
sha256sums_armv6h=('81ceeda72729fcd7935d1881119562415c17f5c686974cfa519a255735b4778a')

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
