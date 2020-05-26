# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=3.15.0
pkgrel=1
pkgdesc='SPARQL server built on the Jena Java framework for building Semantic Web and Linked Data applications'
arch=('any')
url='https://jena.apache.org/'
license=('Apache')
depends=('java-runtime') # does not depend on apache-jena – included in the fat jar
source=(
    "http://www-us.apache.org/dist/jena/binaries/${pkgname}-${pkgver}.tar.gz"
    'fuseki-server'
)
sha512sums=(
    '0a3ba1bb5704a3e2d9b0171f316f7696f306b9dec82c0fc35e7bc171076091688a825900475005b7e73d0efac206cca3af4ad025638b4a485e784f6977d53f60'
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
