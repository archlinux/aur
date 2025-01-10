# Author: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname='opera-extras'
#opera_ver: 116.0.5366.21 (stable)
#opera_chromium_ver: 131.0.6778.86 (old-stable/stable)
#ffmpeg_chromium_ver: 131.0.6778.109 (old-stable/stable)
_pkgname='nwjs-ffmpeg-prebuilt'
pkgver=0.94.1
pkgrel=1
pkgdesc="Full-featured DRM playback support of FFmpeg for Opera web browser"
arch=('x86_64')
url="https=//chromium.googlesource.com/chromium/third_party/ffmpeg/"
license=('custom')
depends=('opera')
makedepends=('libarchive' 'lsb-release' 'nodejs' 'nodejs-nopt' 'npm')
optdepends=('chromium-widevine: Complementary codec enabling a premium web video content on Chromium based web browsers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz" 'COPYING')
md5sums=('71aa098a96184866bae54f5fdf77e569' 'c408a301e3407c3803499ce9290515d6')

build() {
       npm i ${srcdir}/${_pkgname}-${pkgver}/

       npx ${srcdir}/${_pkgname}-${pkgver}/ --platform="linux" --version="v${pkgver}" --arch="x64"
}

package() {
       mkdir  -p "${pkgdir}/usr/lib/opera/lib_extra/"
       bsdtar -xf "${srcdir}/build/out/${pkgver}-linux-x64.zip" \
              -C "${pkgdir}/usr/lib/opera/lib_extra/"

       mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
       cp -a "./COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
