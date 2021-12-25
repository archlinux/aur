# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sawfish
pkgver=1.13.0
pkgrel=1
pkgdesc="An extensible window manager using a Lisp-based scripting language"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Main_Page"
license=('GPL')
depends=('libsm' 'rep-gtk' 'hicolor-icon-theme')
source=(http://download.tuxfamily.org/${pkgname}/${pkgname}_${pkgver}.tar.xz arch_poweroff_defaults.patch)
sha256sums=('816b3c5bfa4cb508db1fc14489fccd023dec899cf13ddeb19bc3e65d7872af5d'
            '34092f761f89fa3db90841e3fd270f42c06f769c53ed524deccdf48f204f611e')
options=('!libtool')


prepare() {
  cd ${pkgname}_${pkgver}
  patch -p1 < "$srcdir"/arch_poweroff_defaults.patch
}

build() {
  cd ${pkgname}_${pkgver}
  ./autogen.sh
  CFLAGS+=" -fcommon" ./configure --prefix=/usr --libexecdir=/usr/lib 
  make
}

package() {
  cd ${pkgname}_${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 sawfish.el "$pkgdir"/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 lisp/sawfish/wm/tile/readme.org \
    "$pkgdir"/usr/share/doc/$pkgname/readme.tiling.org
}
