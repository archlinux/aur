# Contributor: Tomas Kopecny <iam+arch@tomask.info>

pkgname=php56-oci8
_extname=oci8
pkgver=2.0.12
pkgrel=1
pkgdesc="PHP extension for OCI8"
arch=('x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php56' 'oracle-instantclient-sdk')
backup=("etc/php56/conf.d/${_extname}.ini")
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('1f189ebda749b403bc53c0bd0ddaf2c1')

build() {
  cd "${_extname}-${pkgver}"

  phpize56
  ./configure --config-cache \
    --sysconfdir=/etc/php56 \
    --with-php-config=/usr/bin/php-config56 \
    --localstatedir=/var \
    --prefix=/usr \
    --with-oci8=instantclient,/usr/lib
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php56/conf.d/${_extname}.ini"
}

