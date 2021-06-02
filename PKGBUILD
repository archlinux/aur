# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_pkgver=5.6.0-nightly.55
pkgname=ferdi-nightly-bin
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - nightly binary version'
url='https://getferdi.com'
license=('Apache')
arch=('x86_64')
depends=('alsa-lib' 'c-ares' 'ffmpeg' 'gtk3' 'http-parser'
         'libevent' 'libnghttp2' 'libsecret' 'libxkbfile'
         'libxslt' 'libxss' 'libxtst'
         'minizip' 'nss' 're2' 'snappy')
provides=('ferdi')
conflicts=('ferdi' 'ferdi-bin')
source=("${pkgname}-${_pkgver}.rpm::https://github.com/getferdi/nightlies/releases/download/v${_pkgver}/ferdi-${_pkgver}.x86_64.rpm")
sha256sums=('f6fdad433a438051291ba3b96cada4ee863552460e270927e967bac49b3f8403')
b2sums=('487c11f499ce2226b5148b6ed17448c9f2275dbe91845e7335f72794de8a82a091ac6428122a4535c696631373fc6c5381d3d6f2f1c689127d4ad108bfdc84ed')

prepare() {
  sed -E -i -e 's|Exec=/opt/Ferdi/ferdi|Exec=/usr/bin/ferdi|' usr/share/applications/ferdi.desktop
}

package() {
  install -dm0755 "${pkgdir}"/{opt,usr}
  cp -a --no-preserve=ownership opt/Ferdi "${pkgdir}/opt/ferdi"
  cp -a --no-preserve=ownership usr/share "${pkgdir}/usr/share"

  install -dm0755 "${pkgdir}/usr/bin"
  ln -sf /opt/ferdi/ferdi "${pkgdir}/usr/bin/ferdi"

  install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -sf -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    /opt/ferdi/{LICENSE.electron.txt,LICENSES.chromium.html}
}
