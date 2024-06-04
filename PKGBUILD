# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpldm
pkgver=0.8.0
pkgrel=2
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=(aarch64
    riscv64
    x86_64)
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
sha256sums=('4369b8efc62af50af7b7c85d51846d10362ecceac0ea11dd574c9aa004c7b4cc')
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
