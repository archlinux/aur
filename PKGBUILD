# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the SDK
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgbase=nvidia-sdk
pkgname=('nvidia-sdk' 'nvidia-sdk-doc')
pkgver=11.0.10
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('custom')
makedepends=('poppler')
source=("local://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('5348e296192dc533d81ef1fbe21ea0c1e1f9ce35f978dc05efc2f5e163fe5346')

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
