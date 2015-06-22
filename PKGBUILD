# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=graph-gtk-git
pkgver=0.1.60.4e721bb
pkgrel=1
pkgdesc='Provides an embedible "boxes and lines" graph editor in the form of a Gtk+ widget'
arch=('i686' 'x86_64')
license=('LGPL')
url='http://gstreamer.freedesktop.org/'
depends=('libxml2' 'glib2')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection')
provides=('graph-gtk='$pkgver)
conflicts=('graph-gtk')
options=('!libtool')

_gitname='graph-gtk'

#source=('git+file:///home/bmonkey/workspace/gtk/graph-gtk')
source=('git+https://github.com/lubosz/graph-gtk.git#branch=gir')

md5sums=('SKIP')

pkgver() {
  cd $_gitname
  version=$(grep AC_INIT configure.ac | sed 's/AC_INIT(graph-gtk, //' | sed 's/)//')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --enable-introspection
  make
}

package() {
  cd $_gitname
  make DESTDIR="${pkgdir}" install
}
