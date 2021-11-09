# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>

_pkgname=ethlint
pkgname=$_pkgname-git
_pkgauthor=omgitsaheadcrab
pkgver=1.2.5.r1.g39895c1
pkgrel=1
pkgdesc='Ethlint (Formerly Solium) analyzes your Solidity code for style & security issues and fixes them.'
arch=('any')
url='https://github.com/duaraghav8/Ethlint'
license=('MIT')
depends=(nodejs)
makedepends=(npm git)
source=("${pkgname}-${pkgver}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --production
}

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules"
    mkdir -p "${_npmdir}"
    cp -R "${srcdir}/${pkgname}-${pkgver}" "${_npmdir}/${_pkgname}"
    local _bindir="${pkgdir}/usr/bin"
    mkdir -p "${_bindir}"
    ln -s "/usr/lib/node_modules/${_pkgname}/bin/solium.js" "${_bindir}/solium"
}
