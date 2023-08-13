# Maintainer: Your Name <youremail@domain.com>

pkgname=keycutter-git
pkgver=r42.0fc9252
pkgrel=1
pkgdesc="Password generator"
arch=(any)
url="https://github.com/UnicornyRainbow/Secrets"
license=(AGPL3)
depends=(gtk4 libadwaita)
makedepends=(git meson ninja)
provides=(keycutter)
conflicts=(keycutter)
options=()
source=("git+https://github.com/UnicornyRainbow/Secrets.git")
sha256sums=('SKIP')

pkgver() {
  cd Secrets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Secrets
  arch-meson build
  ninja -C build
}

package() {
  cd Secrets
  DESTDIR="${pkgdir}" ninja -C build install
}
