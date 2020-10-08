# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Lubosz Sarnecki <lubosz0@gmail.com>
# Original Package: Martin Wimpress <code@flexion.org>

_pkgbase=nvidia-settings
pkgname=lib32-libxnvctrl
pkgver=455.28
pkgrel=1
pkgdesc='NVIDIA NV-CONTROL X extension (32-bit)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-libxext')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        libxnvctrl_so.patch)
sha512sums=('43bab37c98dc3963b9ed637f740f769e50af8303adc6a214582bf410bd305be0b64320f5ddd433862d112d8c1e49c1f59ae60c1d2efc610ddd33398796e0fec8'
            '91ff94736063b911c83b8876fe3e3778db82e0ffe0102036d81a3a6e872ca44a585914646fcbbbe399cd63aa17685fc7f73263ec4f4084f48768ca4d704037fa')

prepare() {
    cd "${_pkgbase}-${pkgver}"
    patch -p0 < "${srcdir}/libxnvctrl_so.patch"
}

build() {
    export PREFIX=/usr
    export OUTPUTDIR=out
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='i686-pc-linux-gnu-pkg-config'
    cd "${_pkgbase}-${pkgver}"
    make -C src/libXNVCtrl
}

package() {
    cd "${_pkgbase}-${pkgver}"
    cd src/libXNVCtrl
    install -d "${pkgdir}/usr/lib32"
    cp -Pr out/libXNVCtrl.* -t "${pkgdir}/usr/lib32"
}
