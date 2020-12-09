# Maintainer: Jasper van Bourgognie <louiecaulfield@gmail.com>

pkgname=libinput-three-finger-drag
pkgver=1.16.4
pkgrel=3
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
provides=('libinput=1.16.4')
conflicts=('libinput')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson' 'git') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=("libinput::git+https://github.com/louiecaulfield/libinput#tag=1.16.4-3fd")
md5sums=('SKIP')

build() {
  arch-meson libinput build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 libinput/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
