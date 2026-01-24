# Maintainer: Yuma Nur Alfath <yuma@yumana.my.id>
pkgname=epuppy-git
pkgver=0.0.8.1.g2b6eacd
pkgrel=1
options=('!debug')
pkgdesc="Terminal-based EPUB reader (git version)"
arch=('x86_64')
url="https://codeberg.org/scip/epuppy"
license=('GPLv3')
makedepends=('go' 'git')
provides=('epuppy')
conflicts=('epuppy')
source=("$pkgname::git+https://codeberg.org/scip/epuppy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  go build -trimpath -ldflags "-s -w" -o epuppy
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 epuppy "$pkgdir/usr/bin/epuppy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
