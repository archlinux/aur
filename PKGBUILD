# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NVIDIA Video Codec SDK
# You need to download the SDK file from NVIDIA's website. (registration required)
# Download website:
# https://developer.nvidia.com/nvidia-video-codec-sdk/

pkgname=nvidia-sdk
pkgver=7.1.9
pkgrel=1
pkgdesc="NVIDIA Video Codec SDK (NVDECODE and NVENCODE APIs) (needs registration at upstream URL and manual download)"
arch=('i686' 'x86_64')
url="https://developer.nvidia.com/nvidia-video-codec-sdk/"
license=('custom')
options=('!strip')
source=("file://Video_Codec_SDK_${pkgver}.zip"
        'LICENSE')
sha256sums=('6b1a3d822317bf7f075df404181cd770ae7bf414b27e069f74f4e914a8702710'
            '0e574d8c44e23cbfe4ecde5b3d7629bdce64923d58a0d77b67117523b7360455')

package() {
	mkdir -p "${pkgdir}/usr/include/${pkgname}"
	mkdir -p "${pkgdir}/usr/include/${pkgname}/GL"
	mkdir -p "${pkgdir}/usr/lib/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	
	# Includes
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/common/inc"
	install -D -m644 *.h      "${pkgdir}/usr/include/${pkgname}"
	install -D -m644 ./GL/*.h "${pkgdir}/usr/include/${pkgname}/GL"
	
	# Lib
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/Samples/common/lib/linux/${CARCH}"
	install -D -m644 libGLEW.a "${pkgdir}/usr/lib/${pkgname}/libGLEW.a"
	
	# Documentation
	cd "${srcdir}/Video_Codec_SDK_${pkgver}/doc"
	install -D -m644 * "${pkgdir}/usr/share/doc/${pkgname}"
	
	# License
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
