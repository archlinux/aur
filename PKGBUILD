# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: jsteel <mail at jsteel dot org>
# Please report issues at https://github.com/sanduhrs/arch-aur-php-ssh-unstable

_pkgname=php-ssh
pkgname=${_pkgname}-unstable
pkgver=1.2
pkgrel=1
pkgdesc="An SSH2 extension for PHP"
url="http://pecl.php.net/package/ssh2"
license=('PHP')
arch=('i686' 'x86_64')
depends=('php>=7.0.0' 'openssh')
makedepends=('php>=7.0.0' 'git')
provides=('php-ssh')
conflicts=('php-ssh')
install=${_pkgname}.install
source=("${pkgname}::git+https://git.php.net/repository/pecl/networking/ssh2.git#tag=RELEASE_${pkgver/./_}")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  phpize
  ./configure --prefix=/usr --with-ssh2
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  echo ';extension=ssh2.so' > ssh2.ini
  install -Dm644 ssh2.ini "${pkgdir}/etc/php/conf.d/ssh2.ini"
  make install INSTALL_ROOT="${pkgdir}/"
}
