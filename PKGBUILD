# Maintainer: David Roizenman <david@hmnd.io>

pkgname=todoist
pkgver=0.14.0
pkgrel=1
pkgdesc="Todoist CLI Client, written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/sachaos/todoist"
license=('MIT')
makedepends=('go' 'git' 'dep')
optdepends=('peco: for zsh functions script')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sachaos/todoist/archive/v$pkgver.tar.gz")
md5sums=('1a46cc1fff8389aa0c60666ff6f252b6')

prepare() {
 mkdir -p "$srcdir/go/src/github.com/sachaos"
 ln -sf "$srcdir/$pkgname-$pkgver" "$srcdir/go/src/github.com/sachaos/$pkgname"
}

build() {
 export GOPATH="$srcdir/go"
 export PATH="$PATH:$srcdir/go/bin/"
 export GO111MODULE="on"
 cd "$srcdir/go/src/github.com/sachaos/$pkgname"
 make install
}

package() {
  install -Dm755 "$srcdir/go/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  cd "$srcdir/go/src/github.com/sachaos/$pkgname"
  install -Dm644 todoist_functions.sh "${pkgdir}/usr/share/todoist/todoist_functions.sh"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
