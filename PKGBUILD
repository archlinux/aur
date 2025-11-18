# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=dimland-git
pkgver=r36.3934c32
pkgrel=5
pkgdesc='Wayland screen dimmer'
arch=('x86_64' 'aarch64')
url='https://github.com/keifufu/dimland.git'
license=('MIT')
makedepends=('git' 'cargo' 'libxkbcommon')
source=("${pkgname}::git+https://github.com/keifufu/dimland.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --locked --release --target-dir target
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 target/release/dimland "${pkgdir}/usr/bin/dimland"
}

# vim:set ts=2 sw=2 et:
