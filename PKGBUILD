# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=nodejs-docker-langserver
pkgver=0.0.21
pkgrel=1
pkgdesc="Language server for Dockerfiles powered by Node.js"
arch=("i686" "x86_64")
url="https://github.com/rcjsuen/dockerfile-language-server-nodejs"
makedepends=('npm')
_npmname=dockerfile-language-server-nodejs
_npmver="${pkgver}"
_fullpkg="${_npmname}-${_npmver}"
source=("https://registry.npmjs.org/${_npmname}/-/${_fullpkg}.tgz")
noextract=("${_fullpkg}.tgz")
sha1sums=("cb6a526524d5ea5a2580b56cd3ce3102ba6384fc")
package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"${_fullpkg}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
