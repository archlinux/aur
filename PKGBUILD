# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

_pkgver=5.6.0-nightly.13
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
sha256sums=('d848279df78547706483a6cd9d7e92c66f2d92911148caacf312f05e748c2fe4')
b2sums=('79e7d70ecab5d7f7564fd35cc6dff7f92b68b91b99e76fbd61627b61cf62ce6b877d01cc5f2f3beb6d0380ebce9caf76d207dc0ae0799f18079045d04dc095b3')

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
