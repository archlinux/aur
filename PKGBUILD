# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpldm
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=($CARCH)
url="https://github.com/openbmc/libpldm"
license=('Apache-2.0')
groups=()
depends=(glibc)
makedepends=(
    gtest
    meson
    ninja
    abi-dumper
    abi-compliance-checker)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8c742ca0d2c31facb9522d69e93302b980d81915f08726020ad67039fde442cd')
#validpgpkeys=()

build() {
    arch-meson ${pkgname}-${pkgver} build -Dabi=deprecated,stable
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
