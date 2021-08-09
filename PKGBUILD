# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_pkgver=5.6.1-nightly.19
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
cksums=('3900184303')
sha256sums=('d84b66530bfc9c634d717d8e6094bc2e069292abd48bce5f55adfb2145bbce03')
b2sums=('c4ec2d3471e5ecb4f79cba7f0c71e4c360de64460012365b0bb267c18e93868ab691b4ed9a2664b2016f6e56f8d44e704847e7bed5a1e9f029e021c6cb00aea8')

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
