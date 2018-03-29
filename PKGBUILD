# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-parental-controls-git
pkgver=r409.9e72211
pkgrel=1
pkgdesc='Switchboard Parental Controls Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-parental-controls'
license=('GPL3')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-parental-controls')
conflicts=('switchboard-plug-parental-controls')
source=('git+https://github.com/elementary/switchboard-plug-parental-controls.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-parental-controls

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

  arch-meson ../switchboard-plug-parental-controls
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
