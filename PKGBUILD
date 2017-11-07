# Maintainer: David Herrmann <dh.herrmann@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=dbus-broker
pkgver=7
pkgrel=3

pkgdesc='Linux D-Bus Message Broker'
arch=('i686' 'x86_64')
url='https://github.com/bus1/dbus-broker'
license=('Apache')
depends=('libsystemd' 'expat' 'glib2')
makedepends=('git' 'meson' 'systemd' 'python-docutils')

source=("https://github.com/bus1/dbus-broker/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('269239303ebfd3e9d1825d10fd6a7b2e68c219b762e61fcbcef5fc33dbdd7c75')

prepare() {
  rm -Rf build
  mkdir build
}

build() {
  cd build
  CFLAGS="$CFLAGS -Wno-unused-parameter"
  CFLAGS="$CFLAGS -Wno-maybe-uninitialized"
  arch-meson ../$pkgname-$pkgver
  ninja
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}

# vim:set sw=2 et:
