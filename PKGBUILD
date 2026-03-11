# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Filip Dvořák <fila@pruda.com>

pkgname=php-legacy-pdo_sqlsrv
_pkgname=pdo_sqlsrv
pkgver=5.13.0
pkgrel=1
pkgdesc="Microsoft SQL Server PDO driver for PHP (php-legacy)."
arch=('x86_64')
url="https://pecl.php.net/package/${_pkgname}/"
license=('MIT')

depends=('php-legacy' 'msodbcsql')
makedepends=('php-legacy')

_archive="${_pkgname}-${pkgver}"
source=("https://pecl.php.net/get/${_archive}.tgz")
sha256sums=('efa859bcc48d97f25268dbdebf1db25f25610d7fa36b3ee91073c1c99411e24c')

backup=("etc/php-legacy/conf.d/${_pkgname}.ini")


build() {
  cd "$srcdir/${_archive}"

  phpize-legacy
  ./configure --prefix=/usr --with-php-config=/usr/bin/php-config-legacy
  make
}

package() {
  cd "$srcdir/${_archive}"

  make INSTALL_ROOT="$pkgdir" install

  install -dm0755 "$pkgdir/etc/php-legacy/conf.d"
  echo "extension=${_pkgname}.so" > "$pkgdir/etc/php-legacy/conf.d/${_pkgname}.ini"

  install -Dm644 "$srcdir/${_archive}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
