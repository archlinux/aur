# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>

pkgname=plexwatchweb-git
pkgver=r278.16923cc
pkgrel=1
pkgdesc="A web front-end for plexWatch."
arch=('any')
url="https://github.com/ecleese/plexWatchWeb"
license=('unknown')
depends=('php-sqlite')
optdepends=('php-apache: to use the Apache web server'
            'plexwatch: plexwatchweb backend')
options=('!strip')
provides=(plexwatchweb)
replaces=("plexwatchweb")
conflicts=("plexwatchweb")
backup=('etc/webapps/plexWatchWeb/apache.example.conf')
source=("$pkgname::git+${url}.git#branch=dev"
        "apache.example.conf")
sha256sums=("SKIP"
            "ccad38b944e825047d2032541e4df4f2de69a3efcf6d0d0cdd432d00a2915e56")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/plexwatchweb-git ${pkgdir}/usr/share/webapps/plexWatchWeb

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/plexWatchWeb
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/plexWatchWeb/

  find ${pkgdir}/usr/share/webapps/plexWatchWeb -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/plexWatchWeb -type d -exec chmod 0755 {} \;
}
