# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=plexwatchweb
pkgver=1.5.4.2
pkgrel=3
pkgdesc="A web front-end for plexWatch."
arch=('any')
url="https://github.com/ecleese/plexWatchWeb"
license=('unknown')
depends=('php-sqlite')
optdepends=('php-apache: to use the Apache web server'
            'plexwatch: plexwatchweb backend')
options=('!strip')
backup=('etc/webapps/plexWatchWeb/apache.example.conf')
source=("$pkgname.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "apache.example.conf")
sha256sums=("53670b80bd7d52f8c5dbad3a45de3260d4c981706bea1a686e734139117d257d"
            "ccad38b944e825047d2032541e4df4f2de69a3efcf6d0d0cdd432d00a2915e56")

prepare() {
  cd "${srcdir}/plexWatchWeb-${pkgver}"
  find . -type f -name .gitattributes -delete
  find . -type f -name .gitkeep -delete
  find . -type f -name .gitignore -delete
  find . -type f -name .gitmodules -delete
  find . -type f -name .travis.yml -delete
  find . -type d -name .git -exec rm -rf {} \;
}

package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/plexWatchWeb-${pkgver} ${pkgdir}/usr/share/webapps/plexWatchWeb

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/plexWatchWeb
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/plexWatchWeb/

  find ${pkgdir}/usr/share/webapps/plexWatchWeb -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/plexWatchWeb -type d -exec chmod 0755 {} \;
}
