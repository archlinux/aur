# Maintainer: Carlo Abelli <carlo@abelli.me>

pkgname=sirula-git
_pkgname=sirula
pkgver=r43.6e47a8d
pkgrel=1
pkgdesc='An app launcher for wayland'
url='https://github.com/DorianRudolph/sirula'
arch=('x86_64')
license=('GPL3')
makedepends=('cargo' 'git' 'rust')
depends=('gtk-layer-shell')
source=("$_pkgname::git+https://github.com/DorianRudolph/sirula.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
}
