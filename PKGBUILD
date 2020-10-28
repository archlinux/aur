# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

_ver=7.5
_verfull=${_ver}.0
_abi=armeb-eabi
_release=2019.12
_toolchain="gcc-linaro-${_verfull}-${_release}-x86_64_${_abi}"

pkgname=armeb-none-eabi-gcc75-linaro-bin
pkgver=${_ver}_${_release}
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) big-endian target.'
arch=('x86_64')
url='https://www.linaro.org/downloads/'
license=('GPL')
source=(
    "https://releases.linaro.org/components/toolchain/binaries/${_ver}-${_release}/${_abi}/${_toolchain}.tar.xz"
)
md5sums=(
    'SKIP'
)
options=(!strip)

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}/"
    cp -Rv "${srcdir}/${_toolchain}/." "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    for binary in "${srcdir}/${_toolchain}/bin/"*; do
        ln -sv "/opt/${pkgname}/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename "${binary}")"
    done
}
