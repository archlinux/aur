# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Filip Dvořák <fila@pruda.com>

pkgname=php-legacy-pdo_sqlsrv
_pkgname=pdo_sqlsrv
pkgver=5.13.3
pkgrel=1
pkgdesc="Microsoft SQL Server PDO driver for PHP (php-legacy)."
arch=('x86_64')
url="https://pecl.php.net/package/${_pkgname}/"
license=('MIT')

depends=('php-legacy' 'msodbcsql')
makedepends=('php-legacy')

_archive="${_pkgname}-${pkgver}"
source=("https://pecl.php.net/get/${_archive}.tgz")
sha256sums=('198a7b37da0658d36a93d158a0ec179b137b3a4d241c90a6650ae9ee8f91ec4a')

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
