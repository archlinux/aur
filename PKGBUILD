# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/anaseto/boohu
# Upstream: https://github.com/anaseto/boohu

pkgname=('boohu-git')
pkgver=0.9.0.48.gee52056
pkgrel=1
pkgdesc="Break Out Of Hareka's Underground, a roguelike game."
arch=('i686' 'x86_64')
url='https://github.com/anaseto/boohu'
license=('ISC')
depends=()
makedepends=('git' 'go')
provides=('boohu')
#conflicts=('boohu')
source=("$pkgname::git+https://github.com/anaseto/boohu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir"
  rm -fr "$srcdir/src"
  rm -fr "$srcdir/bin"
  git clone "$srcdir/$pkgname" "$GOPATH/src/github.com/anaseto/boohu"
}

package() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/anaseto/boohu"
  go get -v .
  install -Dm 755 "$srcdir/bin/boohu" -t "$pkgdir/usr/bin";
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
