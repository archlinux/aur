# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# NOTE:
# You need to download the SDK file from NVIDIA's website (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=9.0.20
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('custom')
makedepends=('poppler')
source=("local://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('3583d974c4a844e21be17c4d112addbd6f078b837d51337b907cec1cd005b02f')

prepare() {
    cd "Video_Codec_SDK_${pkgver}"
    
    pdftotext -layout LicenseAgreement.pdf
}

package() {
    cd "Video_Codec_SDK_${pkgver}"
    
    # encoder header
    install -D -m644 include/nvEncodeAPI.h -t "${pkgdir}/usr/include/${pkgname}"
    
    # decoder headers
    install -D -m644 include/cuviddec.h -t "${pkgdir}/usr/include/${pkgname}"
    install -D -m644 include/nvcuvid.h  -t "${pkgdir}/usr/include/${pkgname}"
    
    # documentation
    install -D -m644 doc/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    
    # license
    install -D -m644 LicenseAgreement.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
