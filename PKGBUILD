# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>

pkgname=php7-mailparse
pkgver=3.1.2
pkgrel=1
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('x86_64')
url="https://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php7')
backup=('etc/php7/conf.d/mailparse.ini')
source=("https://pecl.php.net/get/mailparse-${pkgver}.tgz"
        'mailparse.ini')
sha256sums=('b0647ab07ea480fcc13533368e38fdb4f4bb45d30dce65fc90652a670a4f4010'
            'e3a71ee16492ff486ad4e6b0c87a3af93bdb081efa5baf78d5d47f290f7ec86a')

build() {
  cd "${srcdir}/mailparse-${pkgver}/"

  phpize7
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

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 "${srcdir}/mailparse.ini" "${pkgdir}/etc/php7/conf.d/mailparse.ini"
}
