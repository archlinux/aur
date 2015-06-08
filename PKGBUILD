# Maintainer: 2ion <dev@2ion.de>
pkgname=firefox-tags2title
_addonid=jid1-nS8WKJB7XgQ0pA@jetpack
_addonid_github=${_addonid//@/.} # Github replaces '@'s with '.'s 
pkgver=0.2.0
pkgrel=1
pkgdesc="Display bookmark tags as part of the tab title"
arch=('any')
url="https://github.com/2ion/ff-tags-to-title"
license=('GPL3')
depends=('firefox-beta-bin')
makedepends=('unzip')
provides=('firefox-tags2title')
conflicts=('firefox-tags2title')
source=("https://github.com/2ion/ff-tags-to-title/releases/download/${pkgver}/${_addonid_github}-${pkgver}.xpi")
sha256sums=('1df7511eef900e408a5acd29cb489ede667fd28324844f563632d8b783ff2e6a')

package() {
  cd "$srcdir"

  local _target_directory="$pkgdir/usr/lib/firefox/browser/extensions/${_addonid}"

  install -d "$_target_directory"
  install -Dm644 bootstrap.js "$_target_directory"
  install -Dm644 install.rdf "$_target_directory"
  install -Dm644 package.json "$_target_directory"
  install -Dm644 lib/main.js "${_target_directory}/lib"

  find "$_target_directory" -type f -exec chmod 644 {} \+
  find "$_target_directory" -type d -exec chmod 755 {} \+
}
