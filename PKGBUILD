# Maintainer: Josef Vybihal <josef dot vybihal at gmail dot com>
# Ported to GTK3 by https://github.com/dallenwilson
# Old Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: cuihao <cuihao dot leo at gmail dot com>
# Original PKGBUILD (community/gstm):
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gstm-git
pkgver=1.3.7.r1.g0eca301
pkgrel=1
pkgdesc="Gnome SSH Tunnel Manager - Gtk3 Edition"
arch=('i686' 'x86_64')
url="https://github.com/dallenwilson/gstm"
license=('GPL')
depends=('openssh' 'libxml2' 'glib2' 'gdk-pixbuf2' 'gtk3' 'libappindicator-gtk3')
makedepends=('intltool' 'autoconf' 'automake' 'gcc' 'pkgconf' 'make')
conflicts=('gstm' 'gstm-gtk2')
provides=('gstm')
source=('git+https://github.com/dallenwilson/gstm.git')
sha256sums=('SKIP')
_gitname='gstm'

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/${_gitname}
  #autoconf -I m4
  ./autogen.sh
}

build() {
  cd ${srcdir}/${_gitname}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install
}