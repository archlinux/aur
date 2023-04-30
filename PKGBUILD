# Maintainer: Fuxfollets <fuex9follets at gmail dot com>

pkgname="tempenv"
pkgver="1.2.0"
_tomlplusplus_lib_ver="3.3.0"
_argparse_lib_ver="2.9"
pkgrel=1
pkgdesc="A quick tool for environment tests creation"
arch=(x86_64)
url="https://github.com/FuexFollets/${pkgname}"
license=("MIT")
checkdepends=()
optdepends=()
depends=(
        gcc-libs
        glibc)
makedepends=(
        git
        gcc
        make
        binutils)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "argparse-${_argparse_lib_ver}.tar.gz::https://github.com/p-ranav/argparse/archive/refs/tags/v${_argparse_lib_ver}.tar.gz"
    "tomlplusplus-${_tomlplusplus_lib_ver}.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v${_tomlplusplus_lib_ver}.tar.gz"
)

sha256sums=('7b9403fcbb1d834ae97a409e0eafcde3c23c5d0207398e2063baf9941e4fd43e'
            'cd563293580b9dc592254df35b49cf8a19b4870ff5f611c7584cf967d9e6031e'
            'fc1a5eb410f3c67e90e5ad1264a1386d020067cfb01b633cc8c0441789aa6cf2')

prepare() {
    cd "${pkgname}-${pkgver}/lib"
    rmdir ./*
    ln -s "${srcdir}/argparse-${_argparse_lib_ver}" "argparse"
    ln -s "${srcdir}/tomlplusplus-${_tomlplusplus_lib_ver}" "tomlplusplus"
}

build() {
    echo "Got to build"
    cd "${pkgname}-${pkgver}"
    make main -j 4
}

package() {
    install -D "${pkgname}-${pkgver}/bin/main" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
