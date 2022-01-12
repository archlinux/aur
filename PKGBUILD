# Maintainer: Jasper van Bourgognie <louiecaulfield@gmail.com>

pkgname=libinput-three-finger-drag
pkgver=1.19.3
pkgrel=0
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
provides=('libinput=1.19.3')
conflicts=('libinput')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom' 'cmake' 'wayland-protocols')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson' 'git') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=("libinput::git+https://github.com/jasper-van-bourgognie/libinput#tag=1.19.3-3fd")
md5sums=('SKIP')

build() {
  arch-meson libinput build \
    -D b_lto=false \
    -D udev-dir=/usr/lib/udev \
    -D tests=false \
    -D documentation=false
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dvm644 libinput/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
