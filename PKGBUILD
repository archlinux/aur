# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgname='php-kadm5'
pkgver=0.4.0
_commit=b24948126f1a1e702cde16f2c44d98e58b9cb382
pkgrel=1
pkgdesc="PHP extension for interfacing with MIT Kerberos V admin servers"
arch=('x86_64')
url="https://github.com/fuhry/php-kadm5"
license=('PHP')
depends=('krb5')
makedepends=('php' 'git')
source=("git+https://github.com/fuhry/php-kadm5.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd ${pkgname}/kadm5
  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}/kadm5
  make test
}

package_php-kadm5() {
  depends+=('php')
  backup=('etc/php/conf.d/kadm5.ini')

  cd ${pkgname}/kadm5

  make INSTALL_ROOT="$pkgdir" install
  install -d "$pkgdir/etc/php/conf.d"
  echo ';extension=kadm5.so' >"$pkgdir/etc/php/conf.d/kadm5.ini"
}

# vim:set ts=2 sw=2 et:

