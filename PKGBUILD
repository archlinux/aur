# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-hardware-viewer-git
_pkgname=gxde-hardware-viewer
pkgver=2.7.0.r0.ge28b9c8
pkgrel=1
pkgdesc="Hardware and driver information viewer for GXDE"
arch=(any)
url='https://github.com/GXDE-OS/gxde-hardware-viewer'
license=(GPL-3.0-or-later)
depends=(python python-pyqt6 python-psutil python-dbus pciutils usbutils polkit bash)
makedepends=(git qt6-tools)
provides=(gxde-hardware-viewer)
conflicts=(gxde-hardware-viewer)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g'
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

build() {
  make -C "$_pkgname" build
}

package() {
  make -C "$_pkgname" install DESTDIR="$pkgdir"
}
