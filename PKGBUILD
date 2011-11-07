# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clutter
pkgver=1.8.2
pkgrel=2
pkgdesc="A GObject based library for creating fast, visually rich graphical user interfaces"
arch=('i686' 'x86_64')
url="http://clutter-project.org/"
options=('!libtool')
license=('LGPL')
depends=('cogl>=1.8.0' 'mesa' 'json-glib' 'atk' 'libxi')
makedepends=('gobject-introspection' 'mesa')
source=(http://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        fallback.patch::http://git.gnome.org/browse/clutter/patch/?id=f05432d57e5e980d0841fd6c13a7f886a46107fe)
sha256sums=('dc899f26448f31cb31e72d80650b8c8ae05acacd5b5d5a44798eabaca0ddfa2f'
            '30c3c1dfdf1c74e8a7dc2cc6eac305127b7441504cb7040b7cf8d46a4b67fdd9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i $srcdir/fallback.patch
  ./configure --prefix=/usr --enable-introspection
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
