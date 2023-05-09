# Maintainer: asamk <asamk at gmx.de>
_name=static-web-apps-cli
_pkgname="azure-${_name}"
pkgname="${_pkgname}-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="Azure Static Web Apps CLI"
arch=('any')
url="https://github.com/Azure/$_name"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('nodejs')
makedepends=('npm')
optdepends=('libsecret: for storing secrets')
source=("${_pkgname}-${pkgver}.tgz::https://github.com/Azure/${_name}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tgz")
b2sums=('41a45b95832e3e73bf7a9c919289c8cd4287363451be690bdddce8d6a5df9505bcb2900bcd7f805e2233c9f6e9dd38e581dd5dd2521eaab621c8471f7212b170')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
