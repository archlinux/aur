# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=launchar-git
pkgver=r41.f6d2934
pkgrel=2
pkgdesc="Minimal application launcher written in Gtk"
arch=('x86_64')
url="https://gitlab.com/abiosoft/launchar"
license=(Apache)
depends=(gtk3 )
makedepends=(git vala meson ninja)
provides=(launchar)
conflicts=(launchar)
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix=/usr build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
