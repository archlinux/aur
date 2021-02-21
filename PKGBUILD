# Maintainer: Tomasz Gruszka <tompear79@gmail.com>
# Contributor: Timo Sarawinski <timo@it-kraut.net>

pkgname=php74-smbclient
_extname=smbclient
pkgver=1.0.5
pkgrel=1
pkgdesc="PHP 7.4 bindings for libsmbclient."
arch=('i686' 'x86_64')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php74' 'smbclient')
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
sha256sums=('d03401706a57a18cb3d3ffec1a250067482840017f8baab63faa6528eb01b8c1')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize74
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo ";extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php74/conf.d/${_extname}.ini"
}
