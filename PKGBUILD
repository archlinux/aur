# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>

pkgname=mermaid-cli
pkgver=8.11.4
pkgrel=1
pkgdesc='Generation of diagram and flowchart from text in a similar manner as markdown (CLI)'
arch=('any')
url='https://github.com/mermaid-js/mermaid-cli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
_npmscope=@mermaid-js
_npmname=mermaid-cli
_npmver=$pkgver
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha256sums=('d45a081df6d0e0c3b19df0ba58ef44e569250eefca86d3b5b326521e3f581fcb')
noextract=("${_npmname}-${_npmver}.tgz")

package() {
    npm install --global --production --prefix "${pkgdir}/usr" "${_npmname}-${_npmver}.tgz"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
