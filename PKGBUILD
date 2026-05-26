# Maintainer: giomarco2107 <giomarco2107@gmail.com>
pkgname=linuxviva-git
pkgver=1
pkgrel=1
pkgdesc="Classeviva client for Linux — native GNOME app (GTK4 + libadwaita)"
arch=('any')
url="https://github.com/Giovix64/linuxviva"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-httpx'
  'python-keyring'
  'webkitgtk-6.0'
)
makedepends=('git' 'meson' 'ninja')
provides=('linuxviva')
conflicts=('linuxviva')
source=("$pkgname::git+https://github.com/Giovix64/linuxviva.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  meson setup builddir \
    --prefix=/usr \
    --buildtype=release
  meson compile -C builddir
}

package() {
  cd "$pkgname"
  meson install -C builddir --destdir "$pkgdir"
}
