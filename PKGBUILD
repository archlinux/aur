# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=firefox-i3-workspaces
pkgver=0.10
pkgrel=2
pkgdesc="Firefox addon to restore windows to correct i3 workspaces"
arch=('any')
url="https://github.com/yurikhan/firefox-i3-workspaces/"
license=('GPL-3.0-only')
depends=(firefox python python-i3ipc)
makedepends=(jaq)
source=(
  i3_workspaces.xpi::${url}/releases/download/${pkgver}/i3_workspaces-${pkgver}.xpi
  ${url}/releases/download/${pkgver}/i3_workspaces.py
  ${url}/releases/download/${pkgver}/i3_workspaces.json
)
sha256sums=('b0aac902a66790328f37a7429334b42c9a95412485d24791ed2c8181d22ff68c'
            'c974ff55cb4e74dc69edb397176b634362a6531151bca3f688fb226121f8028a'
            '8f87055d80f1227c0cc9093187ef1cdb6876153b0330354925b58637aa5e374d')

prepare() {
  jaq -i '.path = "/usr/lib/firefox_i3_workspaces.py"' "${srcdir}/i3_workspaces.json"
}

package() {
  install -Dm444 ${srcdir}/i3_workspaces.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/i3_workspaces.xpi
  install -Dm755 ${srcdir}/i3_workspaces.py ${pkgdir}/usr/lib/firefox_i3_workspaces.py
  install -Dm444 ${srcdir}/i3_workspaces.json ${pkgdir}/usr/lib/mozilla/native-messaging-hosts/i3_workspaces.json
}

# vim:set ts=2 sw=2 et:
