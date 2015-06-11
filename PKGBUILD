# Maintainer : gborzi <gborzi@ieee.org>

pkgname=topmenu-gtk3-git
_gitname=topmenu-gtk
pkgver=2015.03.22
pkgrel=1
pkgdesc="Gtk3 module for topmenu."
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('gtk3')
makedepends=('git')
options=(!libtool)
source=("git+http://git.javispedro.com/cgit/$_gitname.git")
sha1sums=('SKIP')

pkgver() {
   cd "$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/${_gitname}"

   autoreconf -fi
   ./configure --prefix=/usr --with-gtk=3 --with-wnck=wnck1 --disable-static \
      --disable-mate-applet --disable-xfce-applet --libexecdir=/usr/lib/topmenu
   make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/include" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/topmenu-applet.png"
}
