# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-powersave-git
pkgver=r41.59204bd
pkgrel=1
pkgdesc='User-discretion power management utility for Wingpanel'
arch=('x86_64')
url='https://github.com/quequotion/wingpanel-indicator-powersave'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' libgranite.so 'polkit' 'throttlectl')
makedepends=('git' 'meson' 'vala' 'wingpanel' 'polkit')
provides=("${pkgname%-git}" "wingpanel-indicator-cpufreq")
conflicts=("${pkgname%-git}" "wingpanel-indicator-cpufreq")
source=("git+https://github.com/quequotion/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${pkgname%-git}/"

  arch-meson build
  ninja -C build
}

package() {
  cd "${pkgname%-git}/"

  DESTDIR="$pkgdir" ninja -C build install
}

