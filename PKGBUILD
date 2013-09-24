# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.8.0
pkgrel=2
pkgdesc="PGP encryption and signing for nautilus"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/seahorse-nautilus/"
license=('GPL')
depends=('libcryptui' 'gcr' 'nautilus')
makedepends=('intltool')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        glib236.patch)
sha256sums=('8173ef08a700ff254fb5637a7f2138ba7625b19ed2102a82fd69f1ecb8072863'
            '0cefa14a45784c82871815e9bdcebbb96dea50a8e43316475e6a36d5dc47ade5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix compatibility with glib 2.36
  patch -Np1 -i "$srcdir/glib236.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
