# Maintainer: Andrew Anderson <aanderso@tcd.ie>
# Contributors: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-gala-git
pkgver=0.3.0.r169.a71e8c1
pkgrel=2
pkgdesc='The Pantheon Window Manager'
arch=('x86_64')
url='https://github.com/elementary/gala'
license=('GPL3')
groups=('pantheon-unstable')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop'
         'gtk3' 'json-glib' 'libdrm' 'libgee' 'libgl' 'libx11' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxtst'
         'mesa' 'pantheon-mutter-git' 'pango' 'plank' 'wayland'
         'libgranite.so')
makedepends=('git' 'gnome-common' 'granite-git' 'intltool' 'meson' 'vala')
provides=('gala-git' 'gala' 'libgala.so')
conflicts=('gala-git' 'gala')
source=('git+https://github.com/elementary/gala.git')
sha256sums=('SKIP')

pkgver() {
  cd gala

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../gala
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
