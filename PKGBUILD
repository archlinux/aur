# Maintainer: Gina White <ginabytheabay@gmail.com>

pkgname=poltroon
pkgver=0.0.1
pkgrel=1
pkgdesc="An AUR agent for that prioritizes managing batches of packages."
arch=('x86_64' 'i686')
url="https://github.com/ginabythebay/poltroon"
license=('MIT')
depends=('pacman')
makedepends=('go>=1.7')
options=('!strip' '!emptydirs')
source=("https://github.com/ginabythebay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('875002cddf725f7277e172ac96317c17b67e18d73d1c2517a313813ae4d696c6')

_gourl=github.com/ginabythebay/poltroon

build() {
  mkdir -p "$srcdir"/src/github.com/ginabythebay
  ln -sf "$srcdir/$pkgname-$pkgver" "$srcdir/src/$_gourl"

  export GOPATH="$srcdir"
  cd $srcdir/src/${_gourl}/
  go install ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


