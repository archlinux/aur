# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=nodejs-fkill
pkgver=5.2.0
pkgrel=1
pkgdesc="Fabulously kill processes"
arch=("i686" "x86_64")
url="https://github.com/sindresorhus/fkill-cli"
makedepends=('npm')
_npmname=fkill-cli
_npmver="${pkgver}"
_fullpkg="${_npmname}-${_npmver}"
source=("https://registry.npmjs.org/${_npmname}/-/${_fullpkg}.tgz")
noextract=("${_fullpkg}.tgz")
sha1sums=("0debb61bd87bc7e0db8346e5ae3e57b81a454f2f")
package() {
    npm install -g --user root --production --prefix "$pkgdir"/usr "$srcdir"/"${_fullpkg}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
