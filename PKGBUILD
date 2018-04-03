# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# You need to download the SDK file from NVIDIA's website (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=8.1.24
pkgrel=1
pkgdesc="NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)"
arch=('i686' 'x86_64')
url="https://developer.nvidia.com/nvidia-video-codec-sdk/"
license=('custom')
makedepends=('poppler')
options=('!strip' 'staticlibs')
source=("file://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('578d038d9c151e80c03909791485d0cbc1f2deedab4b14d765e203c87a2f626e')

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/include/${pkgname}/GL"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    # includes
    cd "Video_Codec_SDK_${pkgver}/LegacySamples/common/inc"
    install -m644 *.h    "${pkgdir}/usr/include/${pkgname}"
    install -m644 GL/*.h "${pkgdir}/usr/include/${pkgname}/GL"
    
    # lib
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/LegacySamples/common/lib/linux/${CARCH}"
    install -D -m644 libGLEW.a "${pkgdir}/usr/lib/${pkgname}/libGLEW.a"
    
    # documentation
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/doc"
    install -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/Video_Codec_SDK_${pkgver}"
    pdftotext -layout LicenseAgreement.pdf
    install -D -m644 LicenseAgreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
