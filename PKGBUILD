# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the SDK
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgbase=nvidia-sdk
pkgname=('nvidia-sdk' 'nvidia-sdk-doc')
pkgver=11.1.5
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('custom')
makedepends=('poppler')
source=("local://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('d52b0a237dff4a66de55d7b39156462d3ddf6498cb7122cd3911a7c6065ea84b')

prepare() {
    pdftotext -layout "Video_Codec_SDK_${pkgver}/LicenseAgreement.pdf"
}

package_nvidia-sdk() {
    install -D -m644 "Video_Codec_SDK_${pkgver}/Interface"/*.h -t "${pkgdir}/usr/include/${pkgbase}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_nvidia-sdk-doc() {
    pkgdesc+=' (documentation)'
    
    install -D -m644 "Video_Codec_SDK_${pkgver}/Doc"/*.pdf -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/Deprecation_Notices.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
