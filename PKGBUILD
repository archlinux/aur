# Maintainer: Fuxfollets <fuex9follets at gmail dot com>

pkgname="tempenv"
pkgver="1.1.1"
_tomlplusplus_lib_ver="3.3.0"
_argparse_lib_ver="2.9"
pkgrel=1
pkgdesc="Quick tool for environment tests creation"
arch=(x86_64)
url="https://github.com/FuexFollets/${pkgname}"
license=("MIT")
checkdepends=()
optdepends=()
depends=(gcc-libs)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "argparse-${_argparse_lib_ver}.tar.gz::https://github.com/p-ranav/argparse/archive/refs/tags/v${_argparse_lib_ver}.tar.gz"
    "tomlplusplus-${_tomlplusplus_lib_ver}.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v${_tomlplusplus_lib_ver}.tar.gz"
)

sha256sums=('e17ac71a4d94a901d960d40048fd479228afda11310b91e682183bbbb3345c5a'
            'cd563293580b9dc592254df35b49cf8a19b4870ff5f611c7584cf967d9e6031e'
            'fc1a5eb410f3c67e90e5ad1264a1386d020067cfb01b633cc8c0441789aa6cf2')

prepare() {
    cd "${pkgname}-${pkgver}/lib"
    rmdir ./*
    ln -s "${srcdir}/argparse-${_argparse_lib_ver}" "argparse"
    ln -s "${srcdir}/tomlplusplus-${_tomlplusplus_lib_ver}" "tomlplusplus"
}

build() {
    cd "${pkgname}-${pkgver}"
    make tempenv -j 6
}

package() {
    install -D "${pkgname}-${pkgver}/dist/tempenv" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
