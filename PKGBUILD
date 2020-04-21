# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Samleybrize <stephen.berquet at gmail dot com>

pkgname=php-scrypt
_extname=scrypt
pkgver=1.4.2
pkgrel=1
pkgdesc="A PHP wrapper to Colin Percival's Scrypt hashing function implementation"
arch=('x86_64' 'i686')
license=('BSD 2-Clause')
url="https://pecl.php.net/package/scrypt"
depends=('php')
backup=("etc/php/conf.d/_extname.ini")
source=("https://pecl.php.net/get/$_extname-$pkgver.tgz")
sha256sums=('94c7e7f3378f6ddf1755f59d99f61570f380df2b2fa630853a932d58fa38389c')

build() {
  cd "$srcdir/$_extname-$pkgver"
  sed -e '25 d' config.m4 > config.m4.tmp && mv config.m4.tmp config.m4

  phpize
  ./configure --prefix=/usr --enable-scrypt
  make
}

package() {
  cd "$srcdir/scrypt-$pkgver"

  make install INSTALL_ROOT="$pkgdir"
  echo 'extension=scrypt.so' > scrypt.ini 
  install -Dm644 scrypt.ini "$pkgdir/etc/php/conf.d/$_extname.ini"
}

