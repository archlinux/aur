# Maintainer: danieltetraquark
# Contributor: mawcomw  <mawcomw@gmail.com>

pkgname=limesurvey
pkgver=6.3.4+231108
pkgrel=1
pkgdesc="The most popular FOSS online survey tool on the web."
depends=('php')
license=('GPL2')
arch=('any')
url="https://www.limesurvey.org"
source=(
https://download.limesurvey.org/latest-master/limesurvey${pkgver}.zip
)
sha256sums=('3e6b9447f3d3910896c50705fe98ef8f86cfe59de80c714d5600ab74c0092b3a')

optdepends=('apache: a supported application server'
	    'nginx: a supported application server'
	    'mariadb: MariaDB database support'
	    'mysql: MySQL database support'
	    'postgresql: PostgreSQL database support'
            'php-imap: email bounce tracking system'
#            'php-iconv: for some encodings when handling excel files'
            'php-gd: for CAPTCHAs and graphs'
            'php-sodium: for data encryption')
#            'php-ldap: import survey participants using ldap')

backup=('etc/webapps/limesurvey/config.php')

package() {
    _instdir="$pkgdir"/usr/share/webapps
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/limesurvey


    #install license
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$_instdir"
    cp -ra "$srcdir"/limesurvey/ .

    ln -s /etc/webapps/limesurvey/config.php "$pkgdir"/usr/share/webapps/limesurvey/application/config/config.php

    chown -R http:http "$_instdir"/limesurvey/application/config
    chown -R http:http "$_instdir"/limesurvey/upload
    chown -R http:http "$_instdir"/limesurvey/tmp

    chown -R http:http "$pkgdir"/etc/webapps/limesurvey

#    chown -R http:http "$_instdir"/limesurvey/

# TODO: apache, nginx example config

    echo "configure your webserver and phpbackend. Files are at /usr/share/webapps/limesurvey. In the browser, go to /index.php?r=installer."
}
