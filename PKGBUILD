# Author: Alpha Cephei (https://alphacephei.com/en/)
# Maintainer: Daniel Quinn <scratch+archlinuxaur at danielquinn dot org>

pkgname="python-vosk-bin"
pkgver=0.3.45
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

sha512sums_aarch64=("0d53aa13d81f1ec19300ae2aec1235b47a7a6f3b9efd86d42caed93f798c4a55891f47f1e6295d3edc7ab726638e4bcbbd2ab2c742fd72dc4300f3607b914a3f")
sha512sums_armv7l=("5f0f2d5dc440647465431ff6e30464e0e323af2d8c991eb2221b5893906493f35617c5f3202f30bd4bd7e1749879e027a2d5df1b02bae231ba0fd71dbd2381f8")
sha512sums_x86_64=("da481945855067074c0af308ea4c3359df7771837b4927b2cb7716ce1ce5761255555e3cf161de10a273daad724f913372ceccbc200c1fe3602ef9e41ab6d384")

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
