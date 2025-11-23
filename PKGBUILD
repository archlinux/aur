# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

: ${_commit:=020446129bb6d0cd5613096977b4e3bdcc651826} # 2.2.0.r32

_pkgname="doctoc"
pkgname="$_pkgname"
pkgver=2.2.0
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
source=("$_pkgname-${_commit::7}.$_pkgext"::"$url/archive/$_commit.$_pkgext")
sha256sums=('0ae80113a3ddc189540518e1c43b64437fbe4734b9081f72a11e0d0b2c134d3e')

package() {
  cd "$_pkgsrc"

  mkdir -pm755 "$pkgdir/usr"
  npm pack .
  npm install -g --prefix="$pkgdir/usr" . *.tgz

  find "$pkgdir" -name "package.json" -exec sed -e "s&(${pkgdir}|${srcdir})&&" -i {} \;

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
