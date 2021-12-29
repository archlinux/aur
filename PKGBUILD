# Author: Alpha Cephei (https://alphacephei.com/en/)
# Maintainer: Daniel Quinn <scratch+archlinuxaur at danielquinn dot org>

pkgname="python-vosk-bin"
pkgver=0.3.32
pkgrel=1
pkgdesc="Offline open source speech recognition API based on Kaldi and Vosk"
arch=("any")
url="https://github.com/alphacep/vosk-api"
license=("Apache")
depends=("python"
"python-cffi"
"python-pycparser")
makedepends=("python-setuptools"
"python-pip")
provides=("python-vosk")
source_x86_64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")
source_armv7l=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-linux_armv7l.whl")
source_aarch64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-linux_aarch64.whl")
sha512sums_x86_64=("25dc2fd4ce52754612f3b40fd3a60509460c1df5e958026b2c57e5d81d847d823e5c01f43332427933f46ea8227808a321f7f224c00c00deda989f4c7b88745b")
sha512sums_armv7l=("154bb90aece18a7fa0d0a6277c111b21ebef03190b6f71a07a29f70bd24a9230f9bddb36f6bdb61e41e3832c62ebbfeccc4f1d8419ad3320559ba76aaf096e60")
sha512sums_aarch64=("2e23db08bf47a5c05ec887e4fce295c682a87afc15b586459f3143de648d2d7d3affe568ac30304c19d4b117ca691e287e5ab16bb8cd4d27296365dbd7ab5f49")
noextract=("${source_x86_64[@]##*/}"
"${source_aarch64[@]##*/}"
"${source_armv7l[@]##*/}")

package() {

    cd "${srcdir}"

    _url=${source_x86_64}
    if [ "${CARCH}" = "armv7l" ]; then
        _url=${source_armv7l}
    elif [ "${CARCH}" = "aarch64" ]; then
        _url=${source_aarch64}
    fi

    PIP_CONFIG_FILE=/dev/null pip install --isolated --no-deps --root="${pkgdir}/" "${_url[@]##*/}"

}
