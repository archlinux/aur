# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=gala
pkgver=0.3.0.r92.g112a261
pkgrel=1
pkgdesc='The Pantheon Window Manager'
arch=('i686' 'x86_64')
url='https://github.com/elementary/gala'
license=('GPL3')
groups=('pantheon')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-desktop'
         'gtk3' 'json-glib' 'libdrm' 'libgee' 'libgl' 'libx11' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxtst'
         'mesa' 'mutter' 'pango' 'plank' 'wayland'
         'libgranite.so')
makedepends=('git' 'gnome-common' 'granite' 'intltool' 'vala')
provides=('libgala.so')
replaces=('gala-bzr' 'gala-git')
# https://github.com/elementary/gala/tree/stable/loki
_commit='112a261ba3166725655d22c13eb191629cf62ecc'
source=("git+https://github.com/elementary/gala.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd gala
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
