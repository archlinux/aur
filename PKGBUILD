# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: Tetsumaki <http://goo.gl/YMBdA>

pkgname=selfoss
pkgver=2.15
pkgrel=1
pkgdesc="The new multipurpose rss reader, live stream, mashup, aggregation web application"
arch=('any')
url="http://selfoss.aditu.de/"
license=('GPL3')
depends=('php>=5.3' 'php-gd')
optdepends=('apache: server, depedency if not using lighttpd or nginx'
            'lighttpd: server, depedency if not using apache or nginx'
            'nginx: server, depedency if not using lighttpd or apache'
            'mariadb: database, depedency if not using postgresql or sqlite'
            'postgresql: database, depedency if not using mariadb or sqlite'
            'sqlite: database, depedency if not using postgresql or mariadb'
            'php-sqlite: dependency if using sqlite'
            'wget: for automatic updating feeds with cron'
            'curl: for automatic updating feeds with cron')
backup=('etc/webapps/selfoss/config.ini'
        'usr/share/webapps/selfoss/config.ini')
install=${pkgname}.install
source=("https://github.com/SSilence/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('6a42ad93054fc8b356ac23f5ffca7347032315fa2b7b289c98d9d6b55121576b')

package() {
  rm -rf "${srcdir}"/{README.md,${pkgname}-${pkgver}.zip}

  install -d "${pkgdir}"/usr/share/webapps/${pkgname}
  cp -af "${srcdir}"/. "${pkgdir}"/usr/share/webapps/${pkgname}/

  # create config in /etc
  install -d "${pkgdir}"/etc/webapps/${pkgname}
  sed '4,$s/^/;/' "${pkgdir}"/usr/share/webapps/${pkgname}/defaults.ini > "${pkgdir}"/etc/webapps/${pkgname}/config.ini
  ln -sf /etc/webapps/${pkgname}/config.ini "${pkgdir}"/usr/share/webapps/${pkgname}/config.ini

  chmod 755 "${pkgdir}"/usr/share/webapps/${pkgname}/{data/cache,data/favicons,data/logs,data/sqlite,data/thumbnails,public}
  chown -R http: "${pkgdir}"/usr/share/webapps/${pkgname}
}

# vim:set ts=2 sw=2 et:
