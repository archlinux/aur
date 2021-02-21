# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-keyboard-git
pkgver=2.4.1.r151.g2c6b20e
pkgrel=1
pkgdesc='Switchboard Keyboard Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-keyboard'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libgnomekbd'
         'libxklavier' 'libxml2' 'ibus' 'libhandy-1.so'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala' 'libhandy')
provides=('switchboard-plug-keyboard')
conflicts=('switchboard-plug-keyboard')
source=('git+https://github.com/elementary/switchboard-plug-keyboard.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-keyboard

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

  arch-meson switchboard-plug-keyboard build
  ninja -C build
}

package() {
  
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
