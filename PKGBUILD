# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=5.6.0
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
    '53dfe13cdd5f6387a0c62917e275fde2cd2e2f2052bfe7515384934f24915228b8512a2dd2b50b7060cc300c976254349d991fcea239484cae48e0a59d67cd54'
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
