# Maintainer: Jon Doe <devnullvoid.space@gmail.com>

pkgrel=1

pkgname=proxmox-tui-git
pkgdesc='A terminal user interface (TUI) for Proxmox VE'
url='https://github.com/devnullvoid/proxmox-tui'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('proxmox-tui')
conflicts=('proxmox-tui' 'proxmox-tui-bin')
options=('!debug')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('kitty: Better terminal support' 'alacritty: Better terminal support')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/proxmox-tui"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/proxmox-tui"
  make build
}

package() {
  # Install binary
  install -Dm755 "${srcdir}/proxmox-tui/proxmox-tui" "${pkgdir}/usr/bin/proxmox-tui"

  # Install license
  install -Dm644 "${srcdir}/proxmox-tui/LICENSE" "${pkgdir}/usr/share/licenses/proxmox-tui/LICENSE"

  # Install documentation
  install -Dm644 "${srcdir}/proxmox-tui/README.md" "${pkgdir}/usr/share/doc/proxmox-tui/README.md"
}
