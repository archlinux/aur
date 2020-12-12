# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alberto Fangul
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=akira-git
pkgver=0.0.13.r11.ga766d93
pkgrel=1
pkgdesc="Native Linux App for UI and UX Design built in Vala and Gtk"
arch=(x86_64 aarch64)
url="https://github.com/akiraux/Akira"
license=(GPL3)
depends=(goocanvas libgranite.so gtksourceview3 gtk-theme-elementary elementary-icon-theme)
makedepends=(git vala meson appstream)
provides=(akira)
conflicts=(akira)
source=("${pkgname%-git}::git+https://github.com/akiraux/Akira.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.akiraux.akira "$pkgdir/usr/bin/akira"
}
