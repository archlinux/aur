# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=bus1
_pkgname=dbus-broker
pkgdesc='Linux D-Bus Message Broker'
pkgver=1rc1
pkgrel=1

pkgname=$_pkgname
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('glibc' 'libsystemd' 'expat' 'glib2')
makedepends=('git' 'meson')
source=("$pkgname-$pkgver-git::git+https://github.com/$_pkgorg/$_pkgname#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  rm -Rf "build"
  meson --prefix=/usr --buildtype=release "$pkgname-$pkgver-git" "build"
  ninja -v -C "build"
}

check() {
  ninja -v -C "build" test
}

package() {
  DESTDIR="$pkgdir" ninja -v -C "build" install
}
