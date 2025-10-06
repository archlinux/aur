# Maintainer: Matthew Mueller (2disbetter@gmail.com)

pkgname=fw12rotate-git
pkgver=r17.ba2cdd7
pkgrel=1
options=('!debug')
pkgdesc="Framework 12 rotation application for Hyprland on Omarchy or other Arch-based systems"
arch=('x86_64')
url="https://github.com/2disbetter/FW12Rotate"
license=('mit')
depends=('bash' 'inotify-tools' 'iio-sensor-proxy')
optdepends=('hyprland: required for intended use')
makedepends=('git' 'gcc')
source=("git+${url}.git")
sha256sums=('SKIP')
install=fw12rotate-git.install

pkgver() {
  cd FW12Rotate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd FW12Rotate
  g++ fw12rotate.cpp -o FW12Rotate  # Adjust if there are additional flags, headers, or libs (e.g., -std=c++11 or -I/path)
}

package() {
  cd FW12Rotate
  install -Dm755 FW12Rotate "${pkgdir}/usr/local/bin/FW12Rotate"
  install -Dm755 toggle-rotation.sh "${pkgdir}/usr/share/${pkgname}/toggle-rotation.sh"
  install -Dm644 "${srcdir}/fw12rotate-git.install" "${pkgdir}/usr/share/licenses/${pkgname}/fw12rotate-git.install"  # Optional: Install a copy for reference
  # If there are two additional files (e.g., config or header), install them here if needed, e.g.:
  # install -Dm644 file1 "${pkgdir}/usr/share/${pkgname}/file1"
  # install -Dm644 file2 "${pkgdir}/usr/share/${pkgname}/file2"
}
