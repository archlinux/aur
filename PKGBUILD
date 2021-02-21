# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-mouse-touchpad-git
pkgver=2.4.2.r155.gf2d22e1
pkgrel=1
pkgdesc='Switchboard Mouse & Touchpad Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-mouse-touchpad'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-mouse-touchpad')
conflicts=('switchboard-plug-mouse-touchpad')
source=('git+https://github.com/elementary/switchboard-plug-mouse-touchpad.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-mouse-touchpad

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-mouse-touchpad build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
