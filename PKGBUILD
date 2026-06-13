# Maintainer: Remi <r3mis4@yahoo.com>

pkgname=plasmasafe
pkgver=0.1.0.0
pkgrel=1
pkgdesc='KDE Plasma configuration backup and restore tool'
arch=('x86_64')
url='https://github.com/yousefvand/plasmasafe'
license=('MIT')
depends=('gmp' 'libffi')
makedepends=('git' 'ghc' 'cabal-install')
source=("plasmasafe::git+https://github.com/yousefvand/plasmasafe.git#tag=v0.1.0.0")
sha256sums=('SKIP')

build() {
  cd "$srcdir/plasmasafe"
  export HOME="$srcdir/cabal-home"
  cabal update
  cabal build exe:plasmasafe
}

package() {
  cd "$srcdir/plasmasafe"
  export HOME="$srcdir/cabal-home"

  install -Dm755 "$(cabal list-bin exe:plasmasafe)" "$pkgdir/usr/bin/plasmasafe"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [ -f CHANGELOG.md ]; then
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  fi
}
