# Maintainer: James An <james@jamesan.ca>

_tomver=8
pkgname=tomcat$_tomver-solr
pkgver=1.0
pkgrel=1
pkgdesc='Bridging module to set up solr to be served by tomcat.'
arch=('any')
url=
license=('GPL')
depends=(
    'java-commons-logging'
    'slf4j'
    "tomcat$_tomver"
    'solr'
)
install="tomcat$_tomver-solr.install"

package() {
    install -dm755 "$pkgdir/usr/share/java/tomcat$_tomver"
    install -dm775 -o tomcat8 -g tomcat8 "$pkgdir/var/lib/tomcat$_tomver"{,/webapps}

    ln --symbolic --target-directory="$pkgdir/usr/share/java/tomcat$_tomver" /usr/share/java/{commons-logging/commons-logging.jar,slf4j/*}
    ln --symbolic /usr/share/solr/dist/solr-4.10.3.war "$pkgdir/var/lib/tomcat$_tomver/webapps/solr.war"
}
