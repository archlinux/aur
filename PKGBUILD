# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# TODO try to rip apart the fat jar and improve installation per https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=apache-jena-fuseki
pkgver=3.7.0
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
    '5f81e7a59400ee2dcee0b0ede9ecaaea0013ac80f2ddc134262d6aa7e333359a7c617c6b70cc6ba97df53221acbb0f7194d824f61f56dfbc031f78728022bd4b'
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
