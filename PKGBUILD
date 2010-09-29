# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=clutter-gtk
pkgver=0.10.8
pkgrel=2
pkgdesc="GTK clutter widget"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('clutter>=1.4.0' 'gtk2>=2.22.0')
makedepends=('gobject-introspection' 'gtk-doc')
source=(http://www.clutter-project.org/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2
       fix-gir.patch)
sha256sums=('7867f951568871d9f68cbe8a3644fd53d2138f725b7ba61ffc0053eb64e80814'
            'a134d7154f71c995ae09cd606dcf811e1d317818c13a1167b3850c3104dadbd4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-gir.patch"
  gtkdocize
  autoreconf -vi
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
