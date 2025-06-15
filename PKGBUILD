# nesk_aur

pkgname=librewolf-extension-proxy-toggle-bin
_id="{0c3ab5c8-57ac-4ad8-9dd1-ee331517884d}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Toggle between direct connection and a single proxy server via a toolbar icon"
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/proxy-toggle/"
license=('MIT')
depends=('librewolf')
checkdepends=('jq')
groups=('librewolf-addons')
source=("${_id}.xpi::https://addons.mozilla.org/firefox/downloads/file/3405365/proxy_toggle-${pkgver}.xpi")
noextract=("${_id}.xpi")
sha256sums=('467f2567f03ecbc503f931d39d5cd8a144b3279f34f0569c6796303b2013ea52')
b2sums=('4d7be1fffecce162f21fdd1fcda6bf2d512f6f1fcd54160c66a9ab4752886df169ed8a91b14bb713ff40a6a8f18854d63b8740e56f9e83718a0cd1a4ec54a089')

check() {
  bsdtar xf ${_id}.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}

package() {
  _dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_id}.xpi"
  install -Dm644 ${_id}.xpi "${_dest}"
}
