# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-bluetooth-git
pkgver=2.3.4.r13.g5f48a89
pkgrel=1
pkgdesc='Switchboard Bluetooth Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so' 'libgranite.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-bluetooth')
conflicts=('switchboard-plug-bluetooth')
replaces=('switchboard-plug-bluetooth-bzr')
source=('git+https://github.com/elementary/switchboard-plug-bluetooth.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-bluetooth

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-bluetooth build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
