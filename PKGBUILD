# Maintainer: devnullvoid <devnullvoid.space@gmail.com>

pkgname=pvetui-git
pkgver=1.0.5..r0.g39f6b21
pkgrel=1
pkgdesc='A terminal user interface (TUI) for Proxmox VE'
url='https://github.com/devnullvoid/proxmox-tui'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('pvetui')
conflicts=('pvetui' 'pvetui-bin')
options=('!debug')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('kitty: Better terminal support' 'alacritty: Better terminal support')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/.r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  make build
}

package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname}/bin/pvetui" "${pkgdir}/usr/bin/pvetui"

  # Install license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
