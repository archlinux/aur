# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

pkgname=correcthorse
pkgver=1.0
pkgrel=5
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
depends=('glibc>=2.25')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rmartinjak/$pkgname/archive/v$pkgver.tar.gz
        change_prng.patch)
md5sums=('3d691f786f5879f5b902585472d6d195'
         '652145bc56a7d199c95c241cb3744760')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/change_prng.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
