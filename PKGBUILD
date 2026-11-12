# Maintainer: washan
pkgname=kandev-bin
pkgver=0.101.0
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
sha256sums_x86_64=('41f392c96776e3de6228feb87411968fcecf986c54632c8bda83bf8c6f7448da')
sha256sums_aarch64=('1833254b8c2496ad758805d38e3e122900305c86149dc0db35396c2dd654cfe1')

package() {
  cd "${srcdir}/kandev"
  install -Dm755 bin/{kandev,agentctl,agentctl-linux-amd64,agentctl-linux-arm64,agentctl-darwin-amd64,agentctl-darwin-arm64} \
    -t "${pkgdir}/usr/lib/kandev/bin"
  install -Dm644 remote-helpers.json "${pkgdir}/usr/lib/kandev/remote-helpers.json"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/kandev/bin/kandev "${pkgdir}/usr/bin/kandev"
}
