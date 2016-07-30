# Maintainer: Einar Lielmanis <einar@spicausis.lv>

pkgname=sylpheed-beta-iconmod
pkgver=3.5.1
pkgrel=1
pkgdesc="Lightweight e-mail client. Latest official beta with the coonsden.com icon theme."
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'gtk2' 'compface' 'gtkspell')
makedepends=('compface' 'gtkspell')
options=('libtool')
conflicts=('sylpheed' 'sylpheed-beta')
provides=('sylpheed')
source=(http://sylpheed.sraoss.jp/sylpheed/v3.5/sylpheed-$pkgver.tar.bz2{,.asc}
        Sylpheed3.0_icon-set.tar.gz)

build() {
  # do not use $pkgver: for betas are usually different
  cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-3.5.1"
  cd "$srcdir/sylpheed-3.5.1"

  #cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-$pkgver"
  #cd "$srcdir/sylpheed-$pkgver"

  ./configure --prefix=/usr --enable-ldap --enable-gpgme

  make
}

package() {
  #cd "$srcdir/sylpheed-$pkgver"
  cd "$srcdir/sylpheed-3.5.1"
  make DESTDIR="$pkgdir" install
}

validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

md5sums=('d88e892b54b160209c8183ebe2574490'
         'SKIP'
         'f0fa7317216cf4f159f1cd1edfa1af39')
