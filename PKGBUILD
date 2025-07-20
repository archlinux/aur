# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Josia Roßkopf <josia-login@rosskopfs.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
pkgname=nwjs-bin
pkgver=0.101.2
pkgrel=1
pkgdesc='Runtime based on Chromium and node.js'
arch=("x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=(gtk3 nss libxss)
optdepends=(
  "nodejs: npm package support"
  "nw-gyp: native add-on build tool for node-webkit"
)
provides=(nwjs node-webkit)
conflicts=(nwjs node-webkit)
source=("${pkgname}-${pkgver}.tar.gz::http://dl.nwjs.io/v${pkgver}/${pkgname%-bin}-v${pkgver}-linux-x64.tar.gz")
sha256sums=('94ed3e608fa4df022a50973bd4e80ffc43508fcb597a0a767e1ed9a9d9462413')

package() {
  install -d "${pkgdir}"/usr/{lib,bin} # FHS
  mv nwjs-v${pkgver}-linux-x64 "${pkgdir}"/usr/lib/nwjs # breaks --repackage
  rm "${pkgdir}"/usr/lib/nwjs/locales/*.info
  ln -sf /usr/lib/nwjs/nw "${pkgdir}"/usr/bin/nw
  # aac,h264.  fetch-soname-ffmpeg-chromium.sh
  depends+=(vivaldi-ffmpeg-codecs)
  ln -svf /opt/vivaldi/libffmpeg.so.7.5 "${pkgdir}"/usr/lib/nwjs/lib/libffmpeg.so
}
