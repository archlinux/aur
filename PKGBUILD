# Maintainer: washan
pkgname=kandev-bin
pkgver=0.103.1
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
sha256sums_x86_64=('333b6f5f2f5e01654ac4a32a964e2655fb654eea30153acf7b7543b20c8e03cd')
sha256sums_aarch64=('28ab439b50bc9ac1a7c07333575880c04fbfd161e8a57fcd68f02dc0b55693dc')

package() {
  cd "${srcdir}/kandev"
  install -Dm755 bin/{kandev,agentctl,agentctl-linux-amd64,agentctl-linux-arm64,agentctl-darwin-amd64,agentctl-darwin-arm64} \
    -t "${pkgdir}/usr/lib/kandev/bin"
  install -Dm644 remote-helpers.json "${pkgdir}/usr/lib/kandev/remote-helpers.json"
  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/kandev/bin/kandev "${pkgdir}/usr/bin/kandev"
}
