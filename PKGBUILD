# Maintainer: agony <27015 at riseup dot net>

pkgname=kubernetes-mcp-server-bin
pkgver=0.1.2
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
sha256sums_x86_64=('4f599f1acaee84bc11dbee90eb6538a03410651de27ec19a49b5a97e4a30cab6')
sha256sums_aarch64=('1fa5bf41b9f59b0fa6c8012e063c98a3900bf5eda142810a74871885ecfced8f')
sha256sums_powerpc64le=('9bab260641e3bddc77d6a79f1feece2538c639bda8f83de42bfbe317180b35d8')

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
