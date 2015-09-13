# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=plexwatchweb
pkgver=1.5.4.2
pkgrel=1
pkgdesc="A web front-end for plexWatch."
arch=('any')
url="https://github.com/ecleese/plexWatchWeb"
license=('unknown')
optdepends=('php-apache: to use the Apache web server')
makedepends=()
options=('!strip')
backup=('etc/webapps/plexWatchWeb/apache.example.conf')
source=("$pkgname.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "apache.example.conf")
sha256sums=("53670b80bd7d52f8c5dbad3a45de3260d4c981706bea1a686e734139117d257d"
            "3464a757b5e27e3c982220faac1cbd4d1a83650680f3f7b5d99074096dbe05e5")

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
