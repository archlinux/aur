# Maintainer: Matthew Mueller (2disbetter@gmail.com)

pkgname=fw12rotate-git
pkgver=r17.ba2cdd7
pkgrel=2
options=('!debug')
pkgdesc="Framework 12 rotation application for Hyprland on Arch-based systems"
arch=('x86_64')
url="https://github.com/2disbetter/FW12Rotate"
license=('MIT')
depends=('bash' 'inotify-tools' 'iio-sensor-proxy')
optdepends=('hyprland: required for intended use')
makedepends=('git' 'gcc')
source=("git+${url}.git")
sha256sums=('SKIP')
install=fw12rotate-git.install

pkgver() {
  cd fw12rotate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd fw12rotate
  g++ fw12rotate.cpp -o FW12Rotate
}

package() {
  cd fw12rotate
  install -Dm755 FW12Rotate "${pkgdir}/usr/local/bin/fw12rotate"
  install -Dm755 toggle-rotation.sh "${pkgdir}/usr/share/${pkgname}/toggle-rotation.sh"
  install -Dm644 "${startdir}/fw12rotate-git.install" "${pkgdir}/usr/share/${pkgname}/fw12rotate-git.install"
}

