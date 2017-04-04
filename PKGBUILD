# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Robin Martinjak <rob@rmartinjak.de>

pkgname=correcthorse
pkgver=1.0
pkgrel=4
pkgdesc="Passphrase generator based on https://xkcd.com/936/"
arch=('i686' 'x86_64')
url="https://github.com/rmartinjak/correcthorse"
license=('WTFPL')
depends=('glibc>=2.25')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rmartinjak/$pkgname/archive/v$pkgver.tar.gz
        seed.patch)
md5sums=('3d691f786f5879f5b902585472d6d195'
         '34c953a35b1cb563d571005d62c3d199')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/seed.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
