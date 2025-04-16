# Author: Martin Stibor <martin.von.reichenberg@proton.me>

pkgname='opera-extras'
#opera_ver: 118.0.5461.41 (Stable)
#opera_chromium_ver: 133.0.6943.143 (Extented Release - Windows)
#ffmpeg_chromium_ver: 133.0.6943.60 (Old-old-stable/Old-stable/Stable)
_pkgname='nwjs-ffmpeg-prebuilt'
pkgver=0.96.0
pkgrel=1
pkgdesc="Full-featured DRM playback support of FFmpeg (NW.JS) for Opera web browser"
arch=('x86_64')
url="https://nwjs.io"
license=('custom')
depends=('opera')
makedepends=('git' 'libarchive' 'lsb-release' 'ninja' 'nodejs' 'nodejs-nopt' 'npm')
optdepends=('chromium-widevine: Complementary codec enabling a premium web video content on Chromium based web browsers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz" 'COPYING')
md5sums=('9b5a9653569ff91055fab19d75fd9688' 'c408a301e3407c3803499ce9290515d6')

build() {
       npm i ${srcdir}/${_pkgname}-${pkgver}/

       npx ${srcdir}/${_pkgname}-${pkgver}/ --platform="linux" --version="v${pkgver}" --arch="x64"
}

package() {
       install -d     "${pkgdir}/usr/lib/opera/lib_extra/"
       bsdtar  -xf    "${srcdir}/build/out/${pkgver}-linux-x64.zip" \
               -C     "${pkgdir}/usr/lib/opera/lib_extra/"

       install -Dm644 "${srcdir}/COPYING" \
               -t     "${pkgdir}/usr/share/licenses/${pkgname}/"
}
