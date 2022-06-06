# Author: Alpha Cephei (https://alphacephei.com/en/)
# Maintainer: Daniel Quinn <scratch+archlinuxaur at danielquinn dot org>

pkgname="python-vosk-bin"
pkgver=0.3.42
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
provides=("python-vosk=${pkgver}")
conflicts=("python-vosk")

source_aarch64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-linux_aarch64.whl")
source_armv7l=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-linux_armv7l.whl")
source_x86_64=("https://github.com/alphacep/vosk-api/releases/download/v${pkgver}/vosk-${pkgver}-py3-none-manylinux_2_12_x86_64.manylinux2010_x86_64.whl")

sha512sums_aarch64=("19300c50becaad1e68dd1ec7778b200f0e2a8288385a4cf43a69a7a8e3ada5f61c022f3ede79c6bb0876f009f410965b646cc493cf7ee501d7b0735e546ba3f1")
sha512sums_armv7l=("da157084cadc7132a2ca42a481ae831a9949fc36858f0d798840a712aef7d1f46252c61e5ae9680c57769174c36965d029bf632ec108c4639caa8d516bdf5c8c")
sha512sums_x86_64=("1649742ead66c2fdc9fa4fb23e11c79e33d76bbf7e33b92c9484a2f20fbabc73684bace83898f233d463a010e4ebdb327e50160f219b09040161a10f4e883ae2")

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
