# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Sabart Otto <seberm at gmail dot com>

pkgname=adminer
pkgver=4.8.0
pkgrel=1
pkgdesc="A full-featured MySQL management tool written in PHP"
arch=(any)
license=(Apache GPL2)
depends=(php)
optdepends=(apache elasticsearch mariadb mongodb mysql postgresql sqlite)
url=https://www.adminer.org
install=adminer.install
source=("adminer.install"
        "httpd-${pkgname}.conf"
        "https://github.com/vrana/adminer/releases/download/v${pkgver}/adminer-${pkgver}.php")
sha256sums=('e8d00ae49761c4d9cbbb9d3e32756f601e28c74a306d55974accc753b2a5ed36'
            '7886a90cc6e57c48d18048344c1040f3ab6e361dfa7793b17b83604fdfd87f6e'
            'e274268e0e0f2a6b8040c000a969889062904ae7a5ccbaf013dc890e12e32eaa')

package() {
  cd "$srcdir"
  install -Dm0644 "${pkgname}-${pkgver}.php" \
    "$pkgdir/usr/share/webapps/$pkgname/index.php"

  # TODO: I don't really like this. What if someone is using nginx, for
  # example? Or doesn't care to have any configuration installed at all.
  # Consider removing.
  install -Dm0644 "httpd-${pkgname}.conf" \
    "$pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf"
}

# vim: set ts=2 sw=2 et:
