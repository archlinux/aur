# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav
pkgver=1.6.28
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
source=("${pkgname}-${pkgver}.zip::https://github.com/getgrav/grav/archive/${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=('633ca76365e76c8ff0be7d58ad7ce1db5ab51e3b64ff9d1d5a5659561191489d')

package() {
  cd "${pkgdir}"
  install -dm0755 usr/share/webapps/
  mv ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/webapps/${pkgname}
  cd ${pkgdir}/usr/share/webapps/${pkgname}
  chgrp -R http .
  find . -type f | xargs chmod 664
  find ./bin -type f | xargs chmod 775
  find . -type d | xargs chmod 775
  find . -type d | xargs chmod +s
  umask 0002
  rm -Rf *.md composer.json composer.lock .github
  rm $(find . -type f -name .gitkeep | xargs)
  install -Dm644 "${pkgdir}/usr/share/webapps/grav/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
