# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=parcel-bundler
_pkgname=parcel
pkgver=2.4.1
pkgrel=1
pkgdesc="Zero configuration build tool for the web."
arch=(any)
url="https://parceljs.org/"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
options=("!strip")
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('629719623d68cc0a9608de2d9ed055a85866a5c98ea4675e2d3a19514cd1eb80')


package() {

    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # TODO: deal with $srcdir $pkgdir in msgpackr-extract
}
