# Maintainer: washan
pkgname=kandev-bin
pkgver=0.104.0
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
sha256sums_x86_64=('addceb24fbefc2fa9ef85dba56afc9bdb9e5ab6d754bd7b489322501d0b2d011')
sha256sums_aarch64=('8dd0ec07da05a64c5bd8634729a6ba450b4ed15cd03481761800ccb8b62a9f9d')

package() {
  cd "${srcdir}/kandev"
  install -Dm755 bin/{kandev,agentctl,agentctl-linux-amd64,agentctl-linux-arm64,agentctl-darwin-amd64,agentctl-darwin-arm64} \
    -t "${pkgdir}/usr/lib/kandev/bin"
  install -Dm644 remote-helpers.json "${pkgdir}/usr/lib/kandev/remote-helpers.json"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/kandev/bin/kandev "${pkgdir}/usr/bin/kandev"
}
