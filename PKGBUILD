# Maintainer:

_pkgname="supertuxkart-assets"
pkgname="$_pkgname-svn"
pkgver=r18593
pkgrel=1
pkgdesc="A kart racing game featuring Tux and his friends - assets"
url="https://sf.net/projects/supertuxkart"
license=('LicenseRef-Various')
arch=('any')

makedepends=(
  'subversion'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'supertuxkart'
)

options=('!strip')

_pkgsrc="stk-assets"
source=("$_pkgsrc"::"svn+https://svn.code.sf.net/p/supertuxkart/code/stk-assets")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]/}"
}

package() {
  install -dm755 "$pkgdir/usr/share/supertuxkart/data"
  for i in "$_pkgsrc"/[a-z]*/; do
    mv "${i%/}" "$pkgdir/usr/share/supertuxkart/data/"
  done

  install -Dm644 "$_pkgsrc/licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
