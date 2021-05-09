# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=dico
pkgver=2.11
pkgrel=1
pkgdesc="GNU Dictionary Server"
arch=('x86_64')
url="http://puszcza.gnu.org.ua/software/$pkgname"
license=(GPL3)
depends=(python gsasl wordnet-common guile pam pcre)
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha1sums=('f545452d1ecaf3e07780cf9324082c7a788e4afa'
          'SKIP')
validpgpkeys=('325F650C4C2B6AD58807327A3602B07F55D0C732')
   # Sergey Poznyakoff <gray@gnu.org>
   # To validate, see instructions at:
   #   https://puszcza.gnu.org.ua/software/dico/download.html

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/dico \
    --sysconfdir=/etc \
    --with-pcre \
    --with-wordnet
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
