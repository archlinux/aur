# Maintainer: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>

pkgname=php-mailparse
pkgver=3.1.4
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php>=7.3.0')
backup=('etc/php/conf.d/mailparse.ini')
source=("https://pecl.php.net/get/mailparse-${pkgver}.tgz"
        'mailparse.ini')
sha256sums=('1474921b32c7eef825144e2be19b1e9d47505ad409729833fd50c25eacdf9577'
            'e3a71ee16492ff486ad4e6b0c87a3af93bdb081efa5baf78d5d47f290f7ec86a')

build() {
  cd "${srcdir}/mailparse-${pkgver}/"

  phpize
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
  install -D -m 644 "$srcdir"/mailparse.ini "$pkgdir"/etc/php/conf.d/mailparse.ini
}
