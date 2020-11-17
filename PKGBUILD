# Maintainer: Justin Coffman <jcoffman@stlrwind.io>

pkgname=stimmtausch-git
pkgver=r246.575a286
pkgrel=1
pkgdesc="terminal-based MUCK client written in Go"
arch=('x86_64' 'i686')
url="https://stimmtausch.com"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/makyo/${pkgname/-git/}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -m 0755 stimmtausch "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m 0644 docs/cmd/*.1 "$pkgdir/usr/share/man/man1"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
