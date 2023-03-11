# Maintainer: Fuxfollets <fuex9follets at gmail dot com>

pkgname="tempenv"
pkgver=1.1.0
_tomlplusplus_lib_ver="3.3.0"
_argparse_lib_ver="2.9"
pkgrel=1
pkgdesc="Quick tool for environment tests creation"
arch=(x86_64)
url="https://github.com/FuexFollets/tempenv"
license=("MIT")
checkdepends=()
optdepends=()
makedepends=(
    gcc
    gcc-libs
    make
    findutils
)
depends=(
    gcc-libs
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FuexFollets/tempenv/archive/refs/tags/v1.1.0.tar.gz"
    "argparse-${_argparse_lib_ver}.tar.gz::https://github.com/p-ranav/argparse/archive/refs/tags/v2.9.tar.gz"
    "tomlplusplus-${_tomlplusplus_lib_ver}.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.3.0.tar.gz"
)

sha256sums=('a942b2f0ae67b51de57e51e73460a6d4fbadc8c94b4c3c447d3579202cc6b164'
    'cd563293580b9dc592254df35b49cf8a19b4870ff5f611c7584cf967d9e6031e'
    'fc1a5eb410f3c67e90e5ad1264a1386d020067cfb01b633cc8c0441789aa6cf2'
)

prepare() {
    pushd "${pkgname}-${pkgver}/lib"
    rmdir ./*
    ln -s "${srcdir}/argparse-${_argparse_lib_ver}" "argparse"
    ln -s "${srcdir}/tomlplusplus-${_tomlplusplus_lib_ver}" "tomlplusplus"
    popd
}

build() {
    pushd "${pkgname}-${pkgver}"
    make tempenv
    popd
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/tempenv"
    install "${pkgname}-${pkgver}/dist/tempenv" "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
