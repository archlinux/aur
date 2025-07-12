# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2025.7.10
pkgrel=1
pkgdesc="Actively protects your data in your current browser"
arch=('any')
url="https://duckduckgo.com/duckduckgo-help-pages/desktop/firefox"
license=('MPL-2.0')
depends=('librewolf')
checkdepends=('jq')
groups=('librewolf-addons')
source=("${_id}.xpi::https://github.com/duckduckgo/duckduckgo-privacy-extension/releases/download/${pkgver}/duckduckgo_privacy_essentials-${pkgver}.zip")
noextract=("${_id}.xpi")
sha256sums=('c04ac3d999e997cfc4bcba2e1e5379ffcf848155e3099e21f7540b32b1938615')
b2sums=('f54d127e8f17cced396a8b09ada00082e02112767d8b7504df217d496859eb14e236d4dae7763eef246f3eca336a01005de54c3d92b126c2bc7eae021558d4bf')

check() {
  bsdtar xf ${_id}.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
