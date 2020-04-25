# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav
pkgver=1.7.0.rc.8
pkgrel=1
pkgdesc="Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS (without Admin plugin)"
arch=("any")
url="https://getgrav.org"
license=("MIT")
provides=('grav')
depends=('php>=7.1.3' 'php-gd')
optdepends=('php-apcu: A userland caching module for PHP' 
			'xdebug: PHP debugging extension' 
			'apache: A high performance Unix-based HTTP server' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server'
			'php-fpm: FastCGI Process Manager'
			'php-apache: Apache SAPI for PHP')
install=grav.install
source=("https://github.com/getgrav/grav/archive/${pkgver:0:5}-${pkgver:6}/${pkgname}-v${pkgver:0:5}-${pkgver:6}.zip")
sha256sums=('39f96f910e224544c4f898788b4dabb85bd69b951d68f3618069fb8daefda481')

package() {
  cd "${pkgdir}"
  install -dm0755 usr/share/webapps/
  mv ${srcdir}/${pkgname}-${pkgver:0:5}-${pkgver:6} ${pkgdir}/usr/share/webapps/${pkgname}
  cd ${pkgdir}/usr/share/webapps/${pkgname}
  chgrp -R http .
  find . -type f | xargs chmod 664
  find ./bin -type f | xargs chmod 775
  find . -type d | xargs chmod 775
  find . -type d | xargs chmod +s
  umask 0002
  rm -Rf *.md composer.json composer.lock .github
  rm $(find . -type f -name .gitkeep | xargs)
}