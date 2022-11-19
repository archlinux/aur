# Maintainer: Que Quotion <quequotion@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-monitor-git
pkgver=r105.7beb312
pkgrel=1
pkgdesc='Manage processes, monitor of system resources and drives.'
arch=('x86_64')
url='https://github.com/Dirli/pantheon-monitor'
license=('GPL2')
groups=('pantheon-unstable')
depends=('cairo' 'glib2' 'glibc' 'gtk3' lib{granite.so,gee,gtop,wnck} 'udisks2')
makedepends=('git' 'meson' 'vala' 'wingpanel')
provides=("${pkgname%-git}" wingpanel-indicator-{sensors,monitor})
conflicts=("${pkgname%-git}" wingpanel-indicator-{sensors,monitor})
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
