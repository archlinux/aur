# Author: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname='opera-extras'
#opera_ver:    115.0.5322.77  (stable)
#chromium_ver: 130.0.6723.137 (old-stable)
_pkgname='nwjs-ffmpeg-prebuilt'
pkgver=0.93.0
pkgrel=1
pkgdesc="Full-featured DRM playback support of FFmpeg for Opera web browser"
arch=('x86_64')
url="https=//chromium.googlesource.com/chromium/third_party/ffmpeg/"
license=('custom')
depends=('opera')
makedepends=('libarchive' 'lsb-release' 'nodejs' 'nodejs-nopt' 'npm')
optdepends=('chromium-widevine: Complementary codec enabling a premium web video content on Chromium based web browsers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        'COPYING')
md5sums=('SKIP' 'SKIP')

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
