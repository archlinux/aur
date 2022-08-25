# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>
# Contributor: Spencer Rinehart <anubis@overthemonkey.com>

pkgname=php-gnupg
_extname=gnupg
pkgver=1.5.1
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
sha256sums=('a9906f465ab2343cb2f3127ee209c72760238745c34878d9bbc1576486219252')

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
