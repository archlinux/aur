# nesk_aur

pkgname=librewolf-extension-duckduckgo-privacy-essentials
_id="jid1-ZAdIEUB7XOzOJw@jetpack"
pkgver=2025.4.7
pkgrel=1
pkgdesc="Actively protects your data in your current browser"
arch=('any')
url="https://duckduckgo.com/duckduckgo-help-pages/desktop/firefox"
license=('MPL-2.0')
depends=('librewolf')
checkdepends=('jq')
groups=('librewolf-addons')
source=("${_id}.xpi::https://addons.mozilla.org/firefox/downloads/file/4470003/duckduckgo_for_firefox-${pkgver}.xpi")
noextract=("${_id}.xpi")
sha256sums=('8380d403a5412a0fe93716c297c220242b5918939773667e50984c4d60506e63')
b2sums=('f949af74ac33ebf0000dfc6c38ea0abba6d8e15babc812cbf3ed3b4110153387e9b0fe65bdca5c8642809dd4f1106292d90e339b6dd1cf20194cec7b984c2d9f')

check() {
  bsdtar xf ${_id}.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
