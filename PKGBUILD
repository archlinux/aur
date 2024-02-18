# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network-git
pkgver=2.5.0.r120.g4852fbd7
pkgrel=1
pkgdesc='Network plug for Switchboard'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm' 'nm-connection-editor'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-network')
conflicts=('switchboard-plug-network')
source=('switchboard-plug-network::git+https://github.com/elementary/switchboard-plug-networking.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-network

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-network build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
