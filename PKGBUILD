# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sawfish
pkgver=1.11.90
pkgrel=1
pkgdesc="An extensible window manager using a Lisp-based scripting language"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Main_Page"
license=('GPL')
depends=('libsm' 'rep-gtk' 'hicolor-icon-theme')
install=${pkgname}.install
source=(http://download.tuxfamily.org/${pkgname}/${pkgname}_${pkgver}.tar.xz)
sha1sums=('092c088f0af8efe6fd603bd6e9b10f005615a65f')
options=('!libtool')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib 
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 sawfish.el $pkgdir/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 lisp/sawfish/wm/tile/readme.org \
    $pkgdir/usr/share/doc/$pkgname/readme.tiling.org
}
