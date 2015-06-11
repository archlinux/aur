# Maintainer : gborzi <gborzi@ieee.org>

pkgname=topmenu-gtk-git
_gitname=topmenu-gtk
pkgver=2015.03.22
pkgrel=1
pkgdesc="A standalone global menu bar for Gtk+ 2.0 based desktop environments."
url="https://git.javispedro.com/cgit/topmenu-gtk.git/about/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('libwnck')
makedepends=('git')
optdepends=('mate-topmenu-applet-git: Mate panel applet'
            'xfce4-topmenu-plugin-git: Xfce4 panel plugin')
options=(!libtool)
source=("git+http://git.javispedro.com/cgit/$_gitname.git")
sha1sums=('SKIP')
install=$_gitname.install

pkgver() {
   cd "$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
   cd "${srcdir}/${_gitname}"

   autoreconf -fi
   ./configure --prefix=/usr --with-gtk=2 --with-wnck=wnck1 --disable-static \
      --disable-mate-applet --disable-xfce-applet --libexecdir=/usr/lib/topmenu
   make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install
}
