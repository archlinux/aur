# Maintainer: Einar Lielmanis <einar@spicausis.lv>

pkgname=sylpheed-beta-iconmod
pkgver=3.5.0beta3
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
source=(http://sylpheed.sraoss.jp/sylpheed/v3.5beta/sylpheed-$pkgver.tar.bz2{,.asc}
        Sylpheed3.0_icon-set.tar.gz)

build() {
  cp -r "$srcdir/Sylpheed3.0_icon-set/src" "$srcdir/sylpheed-$pkgver"
  cd "$srcdir/sylpheed-$pkgver"

  ./configure --prefix=/usr --enable-ldap --enable-gpgme

  make || return 1
}

package() {
  cd "$srcdir/sylpheed-$pkgver"
  make DESTDIR="$pkgdir" install
}

validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26')

md5sums=('05b3867dbd5e675a0515eb05201a1797'
         'SKIP'
         '9211c926e41673f24600d7912fb1699a')
