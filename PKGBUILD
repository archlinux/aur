# Maintainer: agony <27015 at riseup dot net>

pkgname=kubernetes-mcp-server-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Model Context Protocol (MCP) server for Kubernetes and OpenShift (prebuilt)'
arch=('x86_64' 'aarch64' 'powerpc64le')
url='https://github.com/containers/kubernetes-mcp-server'
license=('Apache-2.0')
depends=('glibc')
provides=("kubernetes-mcp-server=${pkgver}")
conflicts=('kubernetes-mcp-server')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("kubernetes-mcp-server-${pkgver}-linux-amd64::${_release}/kubernetes-mcp-server-linux-amd64")
source_aarch64=("kubernetes-mcp-server-${pkgver}-linux-arm64::${_release}/kubernetes-mcp-server-linux-arm64")
source_powerpc64le=("kubernetes-mcp-server-${pkgver}-linux-ppc64le::${_release}/kubernetes-mcp-server-linux-ppc64le")
sha256sums_x86_64=('363e43a7d865ad2d487f88a827b7d37cdd5b56b4ca6fd86affcd0e231a4104a6')
sha256sums_aarch64=('262d3f3d7800b88574b6be30c1cb4663f81481fa12bd41e02c10d43a66069d3e')
sha256sums_powerpc64le=('40c96c9b28fa296be7aa617a982b10b000a2b4167607eba2cf0007ca2685928e')

build() {
  install -m755 kubernetes-mcp-server-"${pkgver}"-linux-* kubernetes-mcp-server
  for shell in bash fish zsh; do
    ./kubernetes-mcp-server completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm755 kubernetes-mcp-server -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/kubernetes-mcp-server"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/kubernetes-mcp-server.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_kubernetes-mcp-server"
}
