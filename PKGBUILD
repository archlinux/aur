# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Charles Mauch <cmauch@gmail.com>

pkgname=hashcash
pkgver=1.22
pkgrel=5
pkgdesc="a denial-of-service counter measure tool for email/spam."
arch=('x86_64')
url="http://www.hashcash.org"
license=('GPL')
depends=( 'glibc' )
source=(http://www.hashcash.org/source/${pkgname}-${pkgver}.tgz)
md5sums=('31fae207061841dffc7b90ee18e3d0fa')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  if [ "${CARCH}" = "x86_64" ]; then
    make generic-openssl LIBCRYPTO=-lcrypto
  else
    make x86-openssl LIBCRYPTO=-lcrypto
  fi
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  install -Dm755 hashcash "$pkgdir"/usr/bin/hashcash
  install -Dm755 sha1 "$pkgdir"/usr/bin/sha1
  install -Dm755 hashcash.1 "$pkgdir"/usr/share/man/man1/hashcash.1
}
