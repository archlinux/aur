# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

: ${_commit:=d7815f1f950f8d5ec933fa4f70208bf316bb13f8} # 2.3.0

_pkgname="doctoc"
pkgname="$_pkgname"
pkgver=2.3.0
pkgrel=1
epoch=1
pkgdesc="Generates table of contents for markdown files inside local git repository"
arch=('any')
url="https://github.com/thlorenz/doctoc"
license=('MIT')

depends=(
  'nodejs'
)
makedepends=(
  'npm'
)

options=('!emptydirs')

_pkgsrc="$_pkgname-$_commit"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver-${_commit::7}.$_pkgext"::"$url/archive/$_commit.$_pkgext")
sha256sums=('4376a71b32632e8884f3905e813903199a4ae2c8ee5a8f1a55995599bc794062')

package() {
  cd "$_pkgsrc"

  mkdir -pm755 "$pkgdir/usr"
  npm pack .
  npm install -g --prefix="$pkgdir/usr" . *.tgz

  find "$pkgdir" -name "package.json" -exec sed -e "s&(${pkgdir}|${srcdir})&&" -i {} \;

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
