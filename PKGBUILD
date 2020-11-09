# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=adwaita-extended-git
pkgver=r116.16aec4c
pkgrel=1
pkgdesc='A modified default GNOME/GTK theme with some extras/enhancements/additions.'
license=('GPL3')
arch=('any')
url='https://gitlab.com/hrdwrrsk/AdwaitaExtended'
source=("adwaita-extended-git::git+${url}.git#branch=master")
makedepends=('git' 'meson' 'ninja' 'sassc' 'gettext')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  meson build --prefix=/usr
}

package() {
  cd "$pkgname"
  DESTDIR=$pkgdir ninja -C build install
}
