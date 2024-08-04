# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=firefox-librejs
pkgver=7.21.1
pkgrel=2
pkgdesc="detects and blocks nonfree nontrivial JavaScript"
arch=('any')
url="https://www.gnu.org/software/librejs/"
license=('GPL-3.0-or-later')
checkdepends=('jq')
groups=('firefox-addons')
source=("https://ftp.gnu.org/gnu/librejs/librejs-$pkgver.xpi")
noextract=("librejs-${pkgver}.xpi")
sha256sums=('60c5b1663ab2507dc12112e44076bb99c8feed0777b4d40ee74b9aef1b0c7256')

check() {
  bsdtar xf librejs-$pkgver.xpi manifest.json
  jq '.version' manifest.json | grep -E '^"'$pkgver'"$'
}

package() {
  depends=('firefox')
  _extension_id="jid1-KtlZuoiikVfFew@jetpack"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 librejs-${pkgver}.xpi "${_extension_dest}.xpi"
}
