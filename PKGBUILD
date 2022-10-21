# Maintainer: Aidan Neal <decator(dot)c(at)proton(dot)me>
pkgname="qinfo-git"
_pkgname="qinfo"
pkgver=r97.rc3c6e44.
pkgrel=2
pkgdesc="A system info program. Fetches system info and displays it."
arch=("x86_64")
url="https://github.com/El-Wumbus/qinfo"
license=("LGPL3")
provides=("qinfo")
makedepends=("meson" "ninja")
depends=()
optdepends=("snapd: List number of snap packages"
            "flatpak: List number of flatpak packages")
source=($_pkgname::"git+https://github.com/El-Wumbus/qinfo.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.$s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  mkdir -p build
  meson setup build
  meson compile -C build
}
package() {
  cd "$_pkgname"
  install build/qinfo -Dm755 ${pkgdir}/usr/bin/qinfo
}
