# Maintainer: melchips <truphemus dot francois at gmail dot com>

pkgname=webkitgtk-sharp-git
_gitname=webkitgtk-sharp
pkgver=r4.4aff0e6
pkgrel=1
pkgdesc="C-sharp bindings for WebKitGTK+ 3.0 using GObject Introspection"
arch=('i686' 'x86_64')
url="https://github.com/xDarkice/webkitgtk-sharp"
license=('LGPL')
depends=('mono' 'gtk-sharp-git' 'soup-sharp-git')
makedepends=('git')
provides=('webkitgtk-sharp')
conflicts=('webkitgtk-sharp')
options=('!libtool')
source=("$_gitname"::'git://github.com/xDarkice/webkitgtk-sharp.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  msg2 "Starting make..."
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
    cd ${srcdir}/${_gitname}
    make DESTDIR=${pkgdir} install || return 1
}
