# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-applications-git
pkgver=2.1.7.r231.g4c86682
pkgrel=1
pkgdesc='Switchboard Applications Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'flatpak'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-applications')
conflicts=('switchboard-plug-applications')
replaces=('switchboard-plug-applications-bzr')
source=('git+https://github.com/elementary/switchboard-plug-applications.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-applications

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-applications build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
