# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=4.3.1
pkgrel=1
pkgdesc='SPARQL server built on the Jena Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime') # does not depend on apache-jena – included in the fat jar
source=(
    "https://downloads.apache.org/jena/binaries/${pkgname}-${pkgver}.tar.gz"
    'fuseki-server'
)
sha512sums=(
    'f4db927a591207fc7fec3575e34ec3c88b14a75ed1cf2c44c2ee230723c0a5b4da99bddc6d86eed17da58e910d4ef07b9d603b1b5112d408e2484475bbc56bb8'
    'SKIP'
)

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/${pkgname}/" "$pkgdir/usr/bin/"

    # install most files in /opt (yes, I know, I know :/ see TODO at the top)
    cp -r -t "$pkgdir/opt/${pkgname}/" fuseki-server.jar webapp/

    # install our own binary into /usr/bin (ignore the one shipped by upstream)
    install -D -t "$pkgdir/usr/bin/" ../fuseki-server
}
