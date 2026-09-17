# Maintainer: taotieren <admin@taotieren.com>

pkgname=duh
pkgver=1.23.0
pkgrel=1
epoch=
pkgdesc="DUH is a suite of tools for packaging reusable hardware components and designs."
arch=($CARCH)
url="https://github.com/sifive/duh"
license=('Apache-2.0')
groups=()
depends=(
    libgcc_s.so
    libstdc++.so
    libz.so
    sh
    python
    python-cffi
    python-setuptools
    python-platformdirs
    nodejs
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
sha256sums=('599a8b0f46378f524a0c0507fa48e3c257d1149ee6418f1afc53877681394df7')
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
