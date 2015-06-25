# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=CodeEditor
# Variant valid as package name without suffix and prefix
_basepkgname=codeeditor

pkgname=mediawiki-$_basepkgname-git
pkgver=r256.a7f5ae2
pkgrel=1
pkgdesc="An extension adding web based editor for css, js and lua."
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
md5sums=("SKIP")
arch=("any")
url="https://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL" "GPL2" "LGPL" "MPL")
depends=("mediawiki")
makedepends=("git")
provides=("mediawiki-$_basepkgname")
conflicts=("mediawiki-$_basepkgname")

pkgver() {
  cd $_extname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Target extension directory of MediaWiki:
  _extdir="$pkgdir/usr/share/webapps/mediawiki/extensions"
  mkdir -p "$_extdir"
  mv $_extname "$_extdir/"
  rm -r $_extdir/$_extname/.git
}