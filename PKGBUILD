# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=5.4.0
pkgrel=1
pkgdesc='SPARQL server built on the Jena Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime>=17') # does not depend on apache-jena – included in the fat jar
source=(
    "https://downloads.apache.org/jena/binaries/${pkgname}-${pkgver}.tar.gz"
    'fuseki-server'
)
sha512sums=(
    '41a161d058e3f5ee96f2f4e49494cb4b1ca7413d575465f90e312e2a2711adc2e4bb91dcc6fb6f7006ff5d7c095beb4bb84fab3f055520d51b6d71ef975d601f'
    'SKIP'
)

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/${pkgname}/" "$pkgdir/usr/bin/"

    # install the fat jar in /opt (yes, I know, I know :/ see TODO at the top)
    cp -r -t "$pkgdir/opt/${pkgname}/" fuseki-server.jar

    # install our own binary into /usr/bin (ignore the one shipped by upstream)
    # TODO I no longer remember why the upstream one is ignored, as of 5.3.0 it looks fine to me tbh
    install -D -t "$pkgdir/usr/bin/" ../fuseki-server
}
