# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=4.7.0
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
    '9646343a23c2563357207f559cb7437aa91b52d02b87e70d77b746b609e93ed0ad9dce06e072f864d53422946f24aa8ee60d9c594c1f82e8f2ab226eba56e474'
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
