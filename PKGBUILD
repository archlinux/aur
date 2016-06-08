# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Maintainer: stefan-husmann@t-online.de
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=sawfish
pkgver=1.11.90
pkgrel=3
pkgdesc="An extensible window manager using a Lisp-based scripting language"
arch=('i686' 'x86_64')
url="http://sawfish.wikia.com/wiki/Main_Page"
license=('GPL')
depends=('libsm' 'rep-gtk' 'hicolor-icon-theme')
source=(http://download.tuxfamily.org/${pkgname}/${pkgname}_${pkgver}.tar.xz arch_poweroff_defaults.patch)
sha1sums=('092c088f0af8efe6fd603bd6e9b10f005615a65f'
          '73dbf5f93c0124c11f0254267d662f86be1f2767')
options=('!libtool')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib 
  make
}

prepare() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  patch -p1 < "$srcdir"/arch_poweroff_defaults.patch
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 sawfish.el $pkgdir/usr/share/emacs/site-lisp/sawfish.el
  install -Dm644 lisp/sawfish/wm/tile/readme.org \
    $pkgdir/usr/share/doc/$pkgname/readme.tiling.org
}
