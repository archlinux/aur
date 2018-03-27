# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-applications-git
pkgver=r317.d241d8f
pkgrel=1
pkgdesc='Switchboard Applications Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-applications')
conflicts=('switchboard-plug-applications')
replaces=('switchboard-plug-applications-bzr')
source=('git+https://github.com/elementary/switchboard-plug-applications.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-applications

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../switchboard-plug-applications
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
