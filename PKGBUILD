# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-about-git
pkgver=r664.badcac9
pkgrel=1
pkgdesc='Switchboard About Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-about'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-about')
conflicts=('switchboard-plug-about')
source=('git+https://github.com/elementary/switchboard-plug-about.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-about

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

  arch-meson ../switchboard-plug-about
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
