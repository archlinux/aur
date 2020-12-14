# Maintainer: sem.z <sem.z@protonmail.com>

pkgname=libinput-complyue
pkgver=1.16.4
pkgrel=2
pkgdesc="Input device management and event handling library with three finger drag patch made by github.com/complyue"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
provides=('libinput=1.16.4')
conflicts=('libinput')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('gtk3' 'meson' 'git')
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=("libinput::git+https://github.com/aakside/libinput")
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
