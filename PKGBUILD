# Maintainer: Olav Seyfarth <php-legacy-mailparse at seyfarth dot de>
# Contributor: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes at js-webcoding dot de>

pkgname=php-legacy-mailparse
pkgver=3.1.4
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php-legacy>=8.1.0')
backup=('etc/php-legacy/conf.d/mailparse.ini')
source=("https://pecl.php.net/get/mailparse-${pkgver}.tgz"
        'mailparse.ini')
sha256sums=('1474921b32c7eef825144e2be19b1e9d47505ad409729833fd50c25eacdf9577'
            '0d66498ce1dee28ff447e20cfcb9abff50469fed0ce412898cde41dec4a7828a')

build() {
  cd "${srcdir}/mailparse-${pkgver}/"

  phpize-legacy
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/mailparse-${pkgver}/"

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	make test
}

package() {
  cd "${srcdir}/mailparse-${pkgver}/"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m 644 "$srcdir"/mailparse.ini "$pkgdir"/etc/php-legacy/conf.d/mailparse.ini
}
