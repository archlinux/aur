# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-monitor-git
pkgver=r65.cac8a9e
pkgrel=1
pkgdesc='System load indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/PlugaruT/wingpanel-monitor'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'granite' 'geoclue' lib{gee,{granite,wingpanel}.so,gtop,gweather,handy})
makedepends=('git' 'meson' 'vala' 'wingpanel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/PlugaruT/wingpanel-monitor.git")
sha256sums=('SKIP')

pkgver() {
  cd "wingpanel-monitor"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "wingpanel-monitor"
  [ -d build ] && rm -rf build
  arch-meson build
  ninja -C build
}

package() {
  cd "wingpanel-monitor"
  DESTDIR="${pkgdir}" ninja -C build install
}
