# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=todoist
pkgver=0.9.0
pkgrel=1
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("https://github.com/sachaos/todoist/archive/v$pkgver.tar.gz")
sha256sums=('d51605b755f013782fe8b1609cde9d5c08150e366be18c2263569800f55df37a')

prepare() {
 mkdir -p "$srcdir/go"
 export GOPATH="$srcdir/go"
 go get github.com/fatih/color
 go get github.com/spf13/viper
 go get github.com/urfave/cli
 go get github.com/pkg/browser
 go get github.com/sachaos/todoist/lib
 cd $srcdir/$pkgname-$pkgver
 go build -o $pkgname
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/
  rm -r  "$srcdir/go"
}
# vim:set ts=2 sw=2 et:
