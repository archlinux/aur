# Maintainer: macxcool <macxcool at tutanota dot com>
# Contributor: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Boudhayan Gupta <bgupta@kde.org>

_npmname=netlify-cli
_npmver=12.2.9

pkgname=netlify
pkgver=${_npmver}
pkgrel=1
pkgdesc="Create, deploy, and delete new sites hosted on Netlify straight from your terminal"

arch=(any)
url="https://www.netlify.com/docs/cli/"
depends=('nodejs')
makedepends=('npm')
license=('MIT')
options=('!strip')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('5c82465491dbddbb8b4ba1d4996cf0fe5bde282c64455a7789c384b5acf73b5c')

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}

    # Fix file ownership and permissions
    chown -R 0:0 "${pkgdir}/usr"
    find "${pkgdir}/usr" -perm -o+w,g+w -exec chmod o-w,g-w {} +
}
