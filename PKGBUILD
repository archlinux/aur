# Maintainer: Jeremy Kescher <jeremy@kescher.at> 

pkgname=php7-smbclient
_extname=smbclient
pkgver=1.0.5
pkgrel=1
pkgdesc="PHP bindings for libsmbclient (for php7)."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/eduardok/libsmbclient-php"
license=('BSD')
depends=('php7' 'smbclient')
backup=("etc/php7/conf.d/${_extname}.ini")
source=("https://github.com/eduardok/libsmbclient-php/archive/${pkgver}.tar.gz")
sha256sums=('d03401706a57a18cb3d3ffec1a250067482840017f8baab63faa6528eb01b8c1')

build() {
  cd "libsmbclient-php-${pkgver}"

  phpize7
  ./configure --prefix=/usr
  make
}

package() {
  cd "libsmbclient-php-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  echo "extension=smbclient.so" > "${_extname}.ini"
  install -D -m644 "${_extname}.ini" "${pkgdir}/etc/php7/conf.d/${_extname}.ini"
}
