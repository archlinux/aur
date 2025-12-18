# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>
# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-gnupg
_extname=gnupg
pkgver=1.5.4
pkgrel=1
pkgdesc="PHP extension for gnupg/gpgme."
arch=('i686' 'x86_64')
url="https://pecl.php.net/package/${_extname}"
license=('BSD')
depends=('gpgme')
makedepends=('php')
backup=("etc/php/conf.d/${_extname}.ini")
install="php-${_extname}.install"
source=("https://pecl.php.net/get/${_extname}-${pkgver}.tgz")
sha256sums=('4d4a0980759bf259e4129ef02cb592bbeb103b4005e7b4bb6945d79488951a50')

build() {
  cd "${_extname}-${pkgver}"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_extname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=${_extname}.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
