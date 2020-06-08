# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=contentful-cli
pkgver=1.4.7
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
sha256sums=("a7facf07c9d714d95a486e180f7af20b5255c8396d5293e7f2c19ffa91b39e0a")
package() {
    npm install -g --user root --production --prefix "$pkgdir"/usr "$srcdir"/"${_fullpkg}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
