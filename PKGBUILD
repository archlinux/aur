# Contributor: Spencer Rinehart <anubis@overthemonkey.com>
# Contributor: Marcel Pfeiffer <m.pfeiffer@strucnamics.de>
# Contributor: Denis Sobchuk <dnsobchuk@yandex.ru>

pkgname=php74-oci8
_extname=oci8
pkgver=2.2.0
pkgrel=1
pkgdesc="PHP extension for OCI8"
arch=('x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('PHP')
depends=('php74>=7.4.0' 'oracle-instantclient-sdk')
backup=("etc/php/conf.d/${_extname}.ini")
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
md5sums=('678d2a647881cd8e5b458c669dcce215')

build() {
  cd "${_extname}-${pkgver}"

  phpize74
  ./configure --prefix=/usr --with-oci8=instantclient,/usr/lib
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php74/conf.d/${_extname}.ini"
}
