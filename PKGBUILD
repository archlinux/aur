# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.7.0.rc.8
pkgrel=1
pkgdesc="Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS (with Admin plugin)"
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
source=("https://github.com/getgrav/grav/releases/download/${pkgver:0:5}-${pkgver:6}/${pkgname}-v${pkgver:0:5}-${pkgver:6}.zip")
sha256sums=('48739d9d69c4b0b12869cad915f99339dd86e4c89bc121996f2afe7333e2395c')

package() {
  cd "${pkgdir}"
  install -dm0755 usr/share/webapps/${pkgname}
  mv ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/
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
