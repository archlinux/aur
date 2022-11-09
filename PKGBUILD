# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=parcel-bundler
_pkgname=parcel
pkgver=2.8.0
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
sha256sums=('88c7f19d2ef2eb9aa3694617e116f6bb54d007fa5795efa39285bc8ee3bda198')


package() {

    npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # TODO: deal with $srcdir $pkgdir in msgpackr-extract
}
