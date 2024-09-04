# Maintainer:
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

_pkgname="doctoc"
pkgname="$_pkgname"
pkgver=2.6.4
pkgrel=2
pkgdesc="Generates table of contents for markdown files inside local git repository"
arch=('any')
url="https://github.com/technote-space/doctoc"
license=('MIT')

depends=(
  'nodejs'
)
makedepends=(
  'npm'
)

options=('!emptydirs')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('0e24a0e1b60390781368a3b040bb1ec42f19d5d96314c5b19162fd84c768352e')

package() {
  cd "$_pkgsrc"

  install -dm755 "$pkgdir/usr"
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz

  find "$pkgdir" -name "package.json" -exec sed -e "s&(${pkgdir}|${srcdir})&&" -i {} \;

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
