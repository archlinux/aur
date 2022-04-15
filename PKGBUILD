# Maintainer: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>

pkgname=php-mailparse
pkgver=3.1.3
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php>=7.2.0')
backup=('etc/php/conf.d/mailparse.ini')
source=("https://pecl.php.net/get/mailparse-${pkgver}.tgz"
        'mailparse.ini')
sha256sums=('8659ca62dc9a4d7d15f07f97a0e2142cb58251c8e772cd36669ec740d2292471'
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
