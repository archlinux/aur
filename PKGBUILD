# Maintainer: taotieren <admin@taotieren.com>

pkgname=duh
pkgver=1.21.0
pkgrel=1
epoch=
pkgdesc="DUH is a suite of tools for packaging reusable hardware components and designs."
arch=($CARCH)
url="https://github.com/sifive/duh"
license=('Apache-2.0')
groups=()
depends=(
    gcc-libs
    glibc
    sh
    python
    python-cffi
    python-setuptools
    python-platformdirs
    nodejs
    zlib
)
makedepends=(
    npm
    python-pip
)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=()
sha256sums=('54428b896f4ba667a01c4b53ced3051793c97fe1151310cd66b6c79a86b8c21d')
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
