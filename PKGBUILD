# Maintainer: asamk <asamk at gmx.de>
_name=static-web-apps-cli
_pkgname="azure-${_name}"
pkgname="${_pkgname}-bin"
pkgver=1.1.3
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
b2sums=('ce283103d54114f57d8873071cc78527d80887f8ed064f1f696fbdfaff6b0c78a2bda62637bb102d461f097fcd40b4ae4c91f509f6942c3739777fb0db5457f9')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
