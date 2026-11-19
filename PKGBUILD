# Maintainer: washan
pkgname=kandev-bin
pkgver=0.102.0
pkgrel=1
pkgdesc='Orchestrate AI coding agents in a Kanban workspace (prebuilt CLI)'
arch=('x86_64' 'aarch64')
url='https://github.com/kdlbs/kandev'
license=('AGPL-3.0-only')
depends=('ca-certificates' 'git' 'glibc')
optdepends=('docker: run agents in containers'
            'openssh: run agents on remote hosts'
            'xdg-utils: open the web interface in a browser')
provides=("kandev=${pkgver}")
conflicts=('kandev')
options=('!strip' '!debug')
source_x86_64=("kandev-${pkgver}-linux-x64-full.tar.gz::${url}/releases/download/v${pkgver}/kandev-linux-x64-full.tar.gz")
source_aarch64=("kandev-${pkgver}-linux-arm64-full.tar.gz::${url}/releases/download/v${pkgver}/kandev-linux-arm64-full.tar.gz")
sha256sums_x86_64=('4c3da6006f5efbc23cc1154b1157fa0aca61f750df22484efa73520af7bd0b36')
sha256sums_aarch64=('7c96b4f3793d8f3f5d31ee0c9fb911edb0d3eb911a13dafca3487370dd8e4a0b')

package() {
  cd "${srcdir}/kandev"
  install -Dm755 bin/{kandev,agentctl,agentctl-linux-amd64,agentctl-linux-arm64,agentctl-darwin-amd64,agentctl-darwin-arm64} \
    -t "${pkgdir}/usr/lib/kandev/bin"
  install -Dm644 remote-helpers.json "${pkgdir}/usr/lib/kandev/remote-helpers.json"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/kandev/bin/kandev "${pkgdir}/usr/bin/kandev"
}
