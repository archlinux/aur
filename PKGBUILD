# Maintainer: RainbowZephyr <darkfeathers9@gmail.com>

pkgname=wingpanel-monitor-git
pkgver=0.1.0.r25.gcac8a9e
pkgrel=1
pkgdesc='Resources indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/PlugaruT/wingpanel-monitor'
license=('GPL3')
groups=('pantheon-unstable')
depends=('libgweather' 'glib2' 'glibc' 'gtk3' lib{gtop,notify}
         'libwingpanel-2.0.so')
makedepends=('git' 'granite' 'intltool' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-monitor')
conflicts=('wingpanel-monitor')
source=('git+https://github.com/PlugaruT/wingpanel-monitor.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-monitor

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  arch-meson wingpanel-monitor build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
