# Maintainer:
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Andrew Rabert <ar@nullsum.net>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname="xboxdrv"
pkgname="$_pkgname-git"
pkgver=0.8.12.r0.g4c2fbd2
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

provides=("$_pkgname")
conflicts=("$_pkgname")

backup=("etc/default/xboxdrv")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson build "$_pkgsrc"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
