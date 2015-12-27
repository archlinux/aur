# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NVIDIA Video Codec SDK (NVENC API and NVCUVID API)

pkgname=nvidia-sdk
pkgver=6.0.1
_srcurlver="$(echo ${pkgver} | tr -d '.')"
pkgrel=1
pkgdesc="NVIDIA Video Codec SDK (NVENC API and NVCUVID API)"
arch=('any')
url="https://developer.nvidia.com/nvidia-video-codec-sdk/"
license=('custom')
provides=('nvenc-api')
conflicts=('nvenc-api')
source=(nvidia_video_sdk_"$pkgver".zip::"https://developer.nvidia.com/video-sdk-${_srcurlver}"
        'LICENSE')
sha256sums=('05227ee4015dc9bdf52b4fe8b3ba5a077d80962f35fa3b76d25288adb1dd0122'
            'b23d2f61684603966be6eb94db58fe11d2594c3328a72aa005acda1d48596be8')

package() {
	cd "${srcdir}/nvidia_video_sdk_${pkgver}/Samples/common/inc"
	
	mkdir -p "${pkgdir}/usr/include/${pkgname}"
	mkdir -p "${pkgdir}/usr/include/${pkgname}/GL"
	
	install -D -m644 *.h "${pkgdir}/usr/include/${pkgname}"
	
	cd GL
	install -D -m644 *.h "${pkgdir}/usr/include/${pkgname}/GL"
	
	install -D -m644 "$srcdir"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
