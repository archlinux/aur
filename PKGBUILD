# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=TemplateSandbox
# Variant valid as package name without suffix and prefix
_basepkgname=templatesandbox

pkgname=mediawiki-$_basepkgname-git
pkgver=r276.7fb2fc9
pkgrel=1
pkgdesc="An extension to develop templates in testing environment."
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
md5sums=("SKIP")
arch=("any")
url="https://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL")
depends=("mediawiki")
optdepends=("mediawiki-scribunto-git: Supported scripting extension.")
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