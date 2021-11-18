# Maintainer: rany <rany 2 at riseup dot net>

_npmname=surge
_npmver=0.23.0

pkgname=surge.sh
pkgver=${_npmver}
pkgrel=1
pkgdesc="Publish web apps to a CDN with a single command and no setup required."

arch=(any)
url="https://surge.sh/"
depends=('nodejs')
makedepends=('npm')
license=('ISC')
options=('!strip')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('f093e5c20bff22a10a70232e70a0c3e6db89f1b5cb48e10e5809a230abae712d')

package() {
    cd "${srcdir}" || exit 1
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}" || exit 1
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"

    # Fix file ownership and permissions
    chown -R 0:0 "${pkgdir}/usr"
    find "${pkgdir}/usr" -perm -o+w,g+w -exec chmod o-w,g-w {} +
}
