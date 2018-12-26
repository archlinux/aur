# Maintainer: Thomas Gerbet <thomas at gerbet dot me>
# Contributor: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>

pkgname=php-mailparse
pkgver=3.0.2
pkgrel=3
pkgdesc="Extension for parsing and working with email messages (RFC822 and RFC2045)"
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/mailparse"
license=('PHP')
depends=('php>=7.2.0')
backup=('etc/php/conf.d/mailparse.ini')
source=("https://pecl.php.net/get/mailparse-${pkgver}.tgz"
        'mailparse.ini'
        'mailparse-upstream.patch')
sha256sums=('d81a6f8a48e43fca1c0f0d6c90d666830c24d584a23a60add43062aaf221843b'
            'e3a71ee16492ff486ad4e6b0c87a3af93bdb081efa5baf78d5d47f290f7ec86a'
            '5fef263ad49bac3b2b009574d07fda529bcb71856d4e208acf3bd51bccdd5312')

prepare() {
  cd "${srcdir}/mailparse-${pkgver}/"

  patch -Np1 -i "${srcdir}/mailparse-upstream.patch"
}

build() {
  cd "${srcdir}/mailparse-${pkgver}/"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/mailparse-${pkgver}/"

  make INSTALL_ROOT="${pkgdir}/" install
  install -D -m 644 "$srcdir"/mailparse.ini "$pkgdir"/etc/php/conf.d/mailparse.ini
}
