# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: GGR <gaby.greboval at yahoo dot com>

pkgname=mx
pkgver=1.4.7+13+g24efb0cc
pkgrel=3
pkgdesc="A widget toolkit using Clutter"
arch=('x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
depends=('clutter' 'dbus-glib' 'gtk2' 'startup-notification')
makedepends=('gobject-introspection' 'gtk-doc' 'intltool' 'libtool' 'vala' git)
_commit=24efb0cc16007bee02d3b077e8e11cfb5747b256  # mx-1.4
source=("git+https://github.com/clutter-project/mx#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "${srcdir}/$pkgname"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/$pkgname"
    ./configure \
        --prefix=/usr
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd "${srcdir}/$pkgname"
    make DESTDIR="${pkgdir}" install
}
