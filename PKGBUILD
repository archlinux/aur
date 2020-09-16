# Maintainer: hermes83 <hermes83 at github dot com>
pkgname=libanimation-gnome-shell-git
pkgver=3.8.6.r5.gb3005f3
pkgrel=2
pkgdesc="Library that provides animation calculations"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/hermes83/libanimation"
license=(LGPL)
depends=(glib2)
makedepends=(git meson gobject-introspection gmock gtest)
conflicts=('libanimation')
provides=('libanimation')
source=('git+https://github.com/hermes83/libanimation.git')
sha256sums=(SKIP)

pkgver() {
  cd "libanimation"
  git describe --long --tags | sed 's/^Release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/libanimation"

  arch-meson . build
  ninja -C build
}

check() {
  cd "${srcdir}/libanimation"
  
  ninja -C build test
}

package() {
  cd "${srcdir}/libanimation"
  
  DESTDIR="${pkgdir}" ninja -C build install
}
