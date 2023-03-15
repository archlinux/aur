# Maintainer: asamk <asamk at gmx.de>
_name=static-web-apps-cli
_pkgname="azure-${_name}"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
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
b2sums=('e08e8d4f04978c4553b4490173c19551d96dd1d068f4cc7cf539dd7f4c67714569efff7550b915c11bcd2ca370ffe0f1ad544859a7e62283020a3404879e9ef8')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
