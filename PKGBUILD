# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=wego-git
pkgver=r32.0a3ce5b
pkgrel=1
pkgdesc="Weather app for your terminal."
arch=('any')
url="https://github.com/schachmat/wego"
license=('ISC')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
install=wego.install
source=($pkgname::git+https://github.com/schachmat/wego.git)
md5sums=('SKIP')
pkgver() {
  cd $srcdir/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export GOPATH="$srcdir/$pkgname"
    go get github.com/mattn/go-colorable
}

build() {
    cd "$srcdir/$pkgname"
    msg2 'Building wego'
    go build -o wego we.go
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 $srcdir/$pkgname/wego "$pkgdir/usr/bin"
  
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/

}
