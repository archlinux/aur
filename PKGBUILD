# Maintainer: taotieren <admin@taotieren.com>

pkgname=duh
pkgver=1.19.0
pkgrel=1
epoch=
pkgdesc="DUH is a suite of tools for packaging reusable hardware components and designs."
arch=('any')
url="https://github.com/sifive/duh"
license=('Apache')
groups=()
depends=()
makedepends=('npm')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=()
sha256sums=('a71998b54e23322a9c034fdd9c64b11881adb5658772ede9b4a6b7f4c4a88227')
#validpgpkeys=()

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
