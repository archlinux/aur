# Maintainer: Doridian <archlinux at doridian dot net>

pkgname=dimland-git
pkgver=r40.76c653f
pkgrel=1
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
  install -Dm755 src/dim "${pkgdir}/usr/bin/dim"
}

# vim:set ts=2 sw=2 et:
