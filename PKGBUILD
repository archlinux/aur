# Maintainer: WunderWungiel

pkgname=dlssnr-bin
_pkgname=dlssnr
pkgver=0.3.0
pkgrel=1
pkgdesc='DLSS5 Neural Rendering Vulkan layer and helper.'
url="https://github.com/bmitch87/DLSS5VKLayer"
arch=('x86_64')
license=('Apache-2.0')
depends=('bash' 'vulkan-icd-loader' 'qt6-base' 'pciutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!debug')
source_x86_64=("${url}/releases/download/${pkgver}-${pkgrel}/dlssnr_${pkgver}-${pkgrel}_debian13_amd64.deb")
sha256sums_x86_64=('9c6992cac74f8f924dfa9ad93962ce3dbbd7f50fbc0f4c5850454a94f67107f0')


prepare() {
	bsdtar -xf data.tar.xz
}

package() {
	if [ -d "${srcdir}/usr" ]; then
        cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    fi

    if [ -d "${pkgdir}/usr/lib64" ]; then
        install -dm755 "${pkgdir}/usr/lib"
        cp -dr --no-preserve=ownership "${pkgdir}/usr/lib64/." "${pkgdir}/usr/lib/"
        rm -rf "${pkgdir}/usr/lib64"
    fi
}
