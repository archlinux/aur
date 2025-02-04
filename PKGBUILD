# Maintainer: asamk <asamk at gmx.de>
_name=static-web-apps-cli
_pkgname="azure-${_name}"
pkgname="${_pkgname}-bin"
pkgver=2.0.3
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
b2sums=('19ea115836a1bfa25623b7c2461353250cdfeb190494b39dc28562c1075933287ac02791314521e1f78db49dc2018db6298ab98fe0997e829652f30fee5daafa')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
