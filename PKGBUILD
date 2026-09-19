# Maintainer: Wunder_Wungiel

pkgname=dlssnr-bin
_pkgname=dlssnr
pkgver=0.3.1
pkgrel=1
pkgdesc='DLSS5 Neural Rendering Vulkan layer and helper.'
url="https://github.com/bmitch87/DLSS5VKLayer"
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('bash' 'vulkan-icd-loader' 'qt6-base' 'pciutils')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!debug')
source_x86_64=("${url}/releases/download/${pkgver}-${pkgrel}/dlssnr_${pkgver}-${pkgrel}_debian13_amd64.deb")
sha256sums_x86_64=('2a498e2d9add99bb46f8c13a0aa27024367b12089c4267383e62e873cbab8ca4')


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
