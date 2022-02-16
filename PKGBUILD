# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-cpufreq-git
pkgver=r24.7dde286
pkgrel=1
pkgdesc='CPU frequency indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/Dirli/wingpanel-indicator-cpufreq'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' lib{granite,wingpanel}.so 'polkit')
makedepends=('git' 'meson' 'vala' 'wingpanel' 'polkit')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Dirli/${pkgname%-git}.git")
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
