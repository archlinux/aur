# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_pkgver=5.6.0-nightly.71
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
cksums=('4183911777')
sha256sums=('57eae2f3d77807a4dcc1cfa37b90f4a090e890984d9e71a581659576233a107a')
b2sums=('860fdc93b97a200d4abb0d426c7338f6b06ae3b21ca83c030f40cd3ca6e88f6407113115da060c390f1b00c306b0ce1e1eed07d6835a617fcd754cdd583d431b')

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
