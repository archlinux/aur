# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpldm
pkgver=0.17.0
pkgrel=1
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=($CARCH)
url="https://github.com/openbmc/libpldm"
license=('Apache-2.0')
groups=()
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    git
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
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('b578148a8caa4db104580b237dd621c2c560082acfa3f1a2516797c7635f7f0d')
#validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    arch-meson ${srcdir}/${pkgname} build -Dabi=deprecated,stable
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
