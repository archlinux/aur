# Contributor: Tomas Kopecny <iam+arch@tomask.info>

pkgname=php56-oci8
_extname=oci8
pkgver=2.0.10
pkgrel=1
pkgdesc="PHP extension for OCI8"
arch=('x86_64')
url="http://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php56' 'oracle-instantclient-sdk')
backup=("etc/php56/conf.d/${_extname}.ini")
source=("http://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('57b493709b177f475eec19d80d6b47cc')

build() {
  cd "${_extname}-${pkgver}"

  phpize
  ./configure --prefix=/usr --with-oci8=instantclient,/usr/lib
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php56/conf.d/${_extname}.ini"
}

