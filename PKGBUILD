# Maintainer: Felix Morgner <felix.morgner@gmail.com>

pkgname=adwaita-extended-git
pkgver=r66.6bf2c50
pkgrel=1
pkgdesc='A modified default GNOME/GTK theme with some extras/enhancements/additions.'
license=('GPL3')
arch=('any')
url='https://github.com/hrdwrrsk/AdwaitaExtended'
source=('adwaita-extended-git::git+https://github.com/hrdwrrsk/AdwaitaExtended.git#branch=master')
makedepends=('git' 'meson' 'ninja' 'sassc')
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
