# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# You need to download the SDK file from NVIDIA's website (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=8.2.15
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('custom')
makedepends=('poppler')
source=("file://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('053cac688be75926e03b81f71e0427f6f466b265b3132eafabac368c2588fe87')

package() {
    # encoder header
    cd "Video_Codec_SDK_${pkgver}/Samples/NvCodec/NvEncoder"
    install -D -m644 nvEncodeAPI.h -t "${pkgdir}/usr/include/${pkgname}"
    
    # decoder headers
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/NvCodec/NvDecoder"
    install -D -m644 cuviddec.h -t "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 nvcuvid.h  -t "${pkgdir}/usr/include/${pkgname}"
    
    # documentation
    cd "${srcdir}/Video_Codec_SDK_${pkgver}/doc"
    install -D -m644 * -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    cd "${srcdir}/Video_Codec_SDK_${pkgver}"
    pdftotext -layout LicenseAgreement.pdf
    install -D -m644 LicenseAgreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
