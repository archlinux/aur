# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=php-imap
epoch=1
_extname=imap
pkgver=1.0.3
pkgrel=1
pkgdesc="PHP extension for imap"
arch=('x86_64')
license=('PHP-3.01')
url="https://pecl.php.net/package/${_extname}"
depends=('php>=8.3.0' 'c-client' 'libxcrypt')
source=(
  "https://pecl.php.net/get/${_extname}-${pkgver}.tgz"
)
sha256sums=('0c2c0b1f94f299004be996b85a424e3d11ff65ac0a3c980db3213289a4a3faaf')


build() {
    cd "${_extname}-${pkgver}"

    phpize
    ./configure --prefix=/usr --with-kerberos --with-imap-ssl 
    make
}

package() {

    cd "${_extname}-${pkgver}"

    make INSTALL_ROOT="${pkgdir}" install
    echo "extension=${_extname}.so" > "${_extname}.ini"
    install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php/conf.d/${_extname}.ini"
}
