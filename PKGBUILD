# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sensors-git
pkgver=r5.0c29892
pkgrel=1
pkgdesc='Sensors indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/Dirli/wingpanel-indicator-sensors'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'granite' 'libgee' 'libwingpanel-2.0.so')
makedepends=('git' 'granite' 'meson' 'vala' 'libwingpanel-2.0.so')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Dirli/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  [ -d build ] && rm -rf build
  arch-meson build
  ninja -C build
}

package() {
  cd "${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
}
