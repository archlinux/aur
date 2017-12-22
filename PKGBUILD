# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gala-git
pkgver=0.3.0.r96.66b5d4a
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=('x86_64')
url='https://github.com/elementary/gala'
license=('GPL3')
groups=('pantheon-unstable')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop'
         'gtk3' 'json-glib' 'libdrm' 'libgee' 'libgl' 'libx11' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxtst'
         'mesa' 'mutter' 'pango' 'plank' 'wayland'
         'libgranite.so')
makedepends=('git' 'gnome-common' 'granite-git' 'intltool' 'vala')
provides=('gala' 'libgala.so')
conflicts=('gala')
replaces=('gala-bzr')
source=('git+https://github.com/elementary/gala.git')
sha256sums=('SKIP')

pkgver() {
  cd gala

  git describe --tags | sed 's/-/.r/; s/-g/./'
}

build() {
  cd gala

  ./autogen.sh \
    --prefix='/usr' \
    --disable-schemas-compile
  make
}

package() {
  cd gala

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
