# Maintainer: Josef Vybihal <josef dot vybihal at gmail dot com>
# Ported to GTK3 by https://github.com/dallenwilson
# Old Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: cuihao <cuihao dot leo at gmail dot com>
# Original PKGBUILD (community/gstm):
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gstm-git
pkgver=1.3.6.r1.gf4acc41
pkgrel=2
pkgdesc="Gnome SSH Tunnel Manager - Gtk3 Edition"
arch=('i686' 'x86_64')
url="https://github.com/dallenwilson/gstm"
license=('GPL')
depends=('openssh' 'libxml2' 'glib2' 'gdk-pixbuf2' 'gtk3')
makedepends=('intltool' 'autoconf' 'automake')
conflicts=('gstm' 'gstm-gtk2')
provides=('gstm')
source=('git+https://github.com/dallenwilson/gstm.git#branch=fno-common')
sha256sums=('SKIP')
_gitname='gstm'

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
   cd ${srcdir}/${_gitname}
   ./autogen.sh
   ./configure --prefix=/usr
   make || return 1
}

package() {
   cd ${srcdir}/${_gitname}
   make DESTDIR=${pkgdir} install
}
