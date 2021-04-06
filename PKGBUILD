# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=4.0.0
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
    'c0b9ab61a57f2c0e027f9d1a07710a22e672eb87730a6460b0869f6a6997a2628703bd99b1590bccd38bdc2a0f78d7be17890b4b88f65ef5518c882c8736a6b3'
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
