# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.6.28
pkgrel=1
pkgdesc="Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS (with Admin plugin)"
arch=("any")
url="https://getgrav.org"
license=('MIT')
provides=('grav')
depends=('php>=7.1.3' 'php-gd' 'bash')
optdepends=('php-apcu: A userland caching module for PHP' 
            'xdebug: PHP debugging extension' 
            'apache: A high performance Unix-based HTTP server' 
            'nginx: Lightweight HTTP server and IMAP/POP3 proxy server'
            'php-fpm: FastCGI Process Manager'
            'php-apache: Apache SAPI for PHP')
install=grav.install
source=("${pkgname}-${pkgver}.zip::https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=('3ba14d09211cf125cbb01a0f0970df4c8d76b0f2df4021e79c98462f3b8b2422')

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
  install -Dm644 "${pkgdir}/usr/share/webapps/grav-admin/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
