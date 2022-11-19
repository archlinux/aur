# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-weather-git
pkgver=r139.62ba375
pkgrel=2
pkgdesc='Weather indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/casasfernando/wingpanel-indicator-weather'
license=('GPL2')
groups=('pantheon-unstable')
depends=('geoclue2' 'glib2' 'glibc' 'gtk3' lib{granite.so,gweather,notify,handy})
makedepends=('git' 'meson' 'vala' 'wingpanel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/casasfernando/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  arch-meson build
  ninja -C build
}

package() {
  cd "${pkgname%-git}"

  DESTDIR="${pkgdir}" ninja -C build install
}
