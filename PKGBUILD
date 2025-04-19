# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# NOTE:
# In order to build the package, you need to manually download the SDK
# file from NVIDIA's website (registration required). Place the downloaded
# file in the PKGBUILD directory and run makepkg.
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/download

pkgbase=nvidia-sdk
pkgname=('nvidia-sdk' 'nvidia-sdk-doc')
pkgver=13.0.19
pkgrel=1
pkgdesc='NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs)'
arch=('any')
url='https://developer.nvidia.com/nvidia-video-codec-sdk/'
license=('LicenseRef-Custom')
makedepends=('poppler')
source=("local://Video_Codec_SDK_${pkgver}.zip")
sha256sums=('8ce8047af64dfb6b76f4671cedc895a550ba30fc31c1530e37a252ef86352209')

prepare() {
    pdftotext -layout "Video_Codec_SDK_${pkgver}/LicenseAgreement.pdf"
}

package_nvidia-sdk() {
    install -d -m755 "${pkgdir}/usr/include"
    install -D -m644 "Video_Codec_SDK_${pkgver}/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -dr --no-preserve='ownership' "Video_Codec_SDK_${pkgver}/Interface" "${pkgdir}/usr/include/nvidia-sdk"
}

package_nvidia-sdk-doc() {
    pkgdesc+=' (documentation)'
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' "Video_Codec_SDK_${pkgver}/Doc" "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/Deprecation_Notices.pdf" -t "${pkgdir}/usr/share/doc/${pkgbase}"
    install -D -m644 "Video_Codec_SDK_${pkgver}/LicenseAgreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
