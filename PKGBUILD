# Maintainer:
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrew Rabert <ar@nullsum.net>

_pkgname="xboxdrv"
pkgname="$_pkgname"
pkgver=0.8.15
pkgrel=1
pkgdesc="Userspace Xbox gamepad driver and input remapper"
url="https://github.com/xiota/xboxdrv"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'python'
  'dbus-glib'
  'dbus-python'
  'libusb'
  'libx11'
)
makedepends=(
  'git'
  'glib2-devel'
  'meson'
  'ninja'
)

backup=("etc/default/xboxdrv")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('4a2c6d523c52c455214b772dcbf9d03489168ebdb6fb540d3143abf6e881159a')

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
