# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=Scribunto
# Variant valid as package name without suffix and prefix
_basepkgname=scribunto

pkgname=mediawiki-$_basepkgname-git
pkgver=r813.670c49b
pkgrel=1
pkgdesc="An extension to support script enabled content (e.g. lua)."
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
md5sums=("SKIP")
arch=("i686" "x86_64")
url="https://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL")
depends=("mediawiki")
optdepends=("lib32-glibc: When using the 32-bit version of included lua binaries"
            "mediawiki-codeeditor-git: Code editor with scribunto support (diabled by default)")
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