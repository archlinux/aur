# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=ExternalLinks
# Variant valid as package name without suffix and prefix
_extpkgname=externallinks

pkgname=mediawiki-$_extpkgname-git
pkgver=v1.23.r0.b30200f
pkgrel=1
pkgdesc="An extension for listing and validating external links"
source=("$_extname::git+https://github.com/roman-1983/mediawiki-ExternalLinks")
md5sums=("SKIP")
arch=("any")
url="https://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL")
depends=("mediawiki")
makedepends=("git")
provides=("mediawiki-$_basepkgname")
conflicts=("mediawiki-$_basepkgname")

pkgver() {
  cd $_extname
  git describe --long --tags | sed -r 's/([^-]*-)g/r\1/;s/-/./g'
}

package() {
  # Target extension directory of MediaWiki:
  _extdir="$pkgdir/usr/share/webapps/mediawiki/extensions"
  mkdir -p "$_extdir"
  rm -r $_extname/.git
  mv $_extname "$_extdir/"
}