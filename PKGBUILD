# Contributor: E-Hern Lee <ehern.lee@gmail.com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgname=nwjs-sdk-bin
pkgver=0.101.2
pkgrel=1
pkgdesc='Runtime based on Chromium and node.js. SDK release with DevTools'
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=(gtk3 libxss nss libxss)
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=("nwjs-sdk")
conflicts=("nwjs-sdk")
source=("${pkgname}-${pkgver}.tar.gz::http://dl.nwjs.io/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz")
sha512sums=('b2c50b070a6a4684f243cd940af9b5a5956d616f2524fcebc01cae162cb26484bf36d246d06418e8a44de6517e7610d43ffaf0c635369a9998c18411fbe9f19c')

package() {
  install -d "${pkgdir}"/usr/lib # FHS
  mv nwjs-sdk-v${pkgver}-linux-x64 "${pkgdir}"/usr/lib/nwjs # breaks --rpackage
  # aac,h264.  fetch-soname-ffmpeg-chromium.sh
  depends+=(vivaldi-ffmpeg-codecs)
  ln -sf /opt/vivaldi/libffmpeg.so.7.5 "${pkgdir}"/usr/lib/nwjs/lib/libffmpeg.so
}
