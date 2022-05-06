# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=42.1.1.2.gbfa4b2c
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://wiki.gnome.org/Projects/Mutter/RemoteDesktop"
license=('GPL2')
depends=(
  'cairo'
  'dconf'
  'freerdp'
  'fuse3'
  'libnotify'
  'libepoxy'
  'libsecret'
  'libvncserver'
  'pipewire'
)
makedepends=(
  'git'
  'asciidoc'
  'ffnvcodec-headers'
  'meson'
)
optdepends=('nvidia-utils: Nvidia NVDEC/NVENC support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://gitlab.gnome.org/GNOME/$_pkgname.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  rm -rf build
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}

# vim:set ts=2 sw=2 et:
