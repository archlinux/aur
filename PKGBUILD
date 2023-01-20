# Maintainer: asamk <asamk at gmx.de>
_name=static-web-apps-cli
_pkgname="azure-${_name}"
pkgname="${_pkgname}-bin"
pkgver=1.0.5
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
b2sums=('cf1b998267c6939cbc17cb067ddf78cc73893aa876cc728065d220ef03b66f6ff5cc26f16184210e2d8db304ed2334466c34153bdcfbd7c24519b8cccb39dae9')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
