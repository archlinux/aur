# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=contentful-cli
pkgver=1.4.19
pkgrel=1
pkgdesc="The official Contentful command line interface"
arch=("i686" "x86_64")
url="https://github.com/contentful/contentful-cli"
depends=('nodejs')
makedepends=('npm')
license=('MIT')
_npmname=contentful-cli
_npmver="${pkgver}"
_fullpkg="${_npmname}-${_npmver}"
source=("https://registry.npmjs.org/${_npmname}/-/${_fullpkg}.tgz")
noextract=("${_fullpkg}.tgz")
sha256sums=("7059ca1595b749a12f98f78f9080c793e990f49e936ba088254c21acda1e0d37")
package() {
    npm install -g --user root --production --prefix "$pkgdir"/usr "$srcdir"/"${_fullpkg}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
