# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=nodejs-contentful-cli
pkgver=1.1.5
pkgrel=1
pkgdesc="The official Contentful command line interface"
arch=("i686" "x86_64")
url="https://github.com/contentful/contentful-cli"
makedepends=('npm')
license=('MIT')
_npmname=contentful-cli
_npmver="${pkgver}"
_fullpkg="${_npmname}-${_npmver}"
source=("https://registry.npmjs.org/${_npmname}/-/${_fullpkg}.tgz")
noextract=("${_fullpkg}.tgz")
sha256sums=("09f1fdf05007f2ff13db4a394ee1d0c58f18df4c0f7a44d13ca4b94c6cbea8af")
package() {
    npm install -g --user root --production --prefix "$pkgdir"/usr "$srcdir"/"${_fullpkg}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
