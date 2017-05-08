# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# You need to download the SDK file from NVIDIA's website (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=8.0.14
pkgrel=1
pkgdesc="NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)"
arch=('i686' 'x86_64')
url="https://developer.nvidia.com/nvidia-video-codec-sdk/"
license=('custom')
options=('!strip' 'staticlibs')
source=("file://Video_Codec_SDK_${pkgver}.zip"
        'LICENSE')
sha256sums=('3dfff57702dd2ffad833d28390bdcd7367262588f86a471d4af0091de7e0db6c'
            '35c0656b536b2b0d0ea589f0b39e04589725f8b695d69cfffcba3b125e3c70e7')

package() {
    # directories creation
    mkdir -p "${pkgdir}/usr/include/${pkgname}/GL"
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    # includes
    cd "Video_Codec_SDK_${pkgver}/Samples/common/inc"
    install -m644 *.h    "${pkgdir}/usr/include/${pkgname}"
    install -m644 GL/*.h "${pkgdir}/usr/include/${pkgname}/GL"
    
    # lib
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/common/lib/linux/${CARCH}"
    install -D -m644 libGLEW.a "${pkgdir}/usr/lib/${pkgname}/libGLEW.a"
    
    # documentation
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/doc"
    install -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
