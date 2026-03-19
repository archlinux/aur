# Maintainer: macxcool <macxcool at tutanota dot com>
# Contributor: mutantmonkey <aur@mutantmonkey.mx>
# Contributor: Boudhayan Gupta <bgupta@kde.org>

_npmname=netlify-cli
_npmver=24.3.0

pkgname=netlify
pkgver=${_npmver}
pkgrel=1
pkgdesc="Create, deploy, and delete new sites hosted on Netlify straight from your terminal"

arch=(any)
url="https://www.netlify.com/docs/cli/"
depends=('nodejs' 'npm')
license=('MIT')
options=('!strip')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('6de973daed8960bc735d5512c40c7727c4b4e1d25ef0eeb05be75928cabd37d3')

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
