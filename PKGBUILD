# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
_baseversion=0.0
_debiangitsuffix=git20150803.0.bd09cd9
_debianpkgrel=1
pkgver=$_baseversion$_debiangitsuffix
pkgrel=1
pkgdesc="debianize go library packages"
arch=('x86_64' 'i686')
url=https://github.com/Debian/dh-make-golang
license=('BSD')
makedepends=('go'
             'git')
options=('!strip' '!emptydirs')
source=("http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix.orig.tar.bz2"
	"http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix-$_debianpkgrel.debian.tar.xz")

sha256sums=('bfc00b8fcd5d6c8005ab4c5fdf7188e63304953c337345c6a48165ad203adf0a'
            'b8e5b8bb4b2c77608f0399a19da94541325eea0ab78947b00a9e956c83414a15')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/russross/blackfriday
  go get golang.org/x/net/publicsuffix
  go get golang.org/x/tools/go/vcs
}

build() {
  cd "$pkgname"

  GOPATH="$srcdir" go build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  cd "$srcdir/debian"
  install -Dm644 man/dh-make-golang.1 "$pkgdir/usr/share/man/man1/dh-make-golang.1"
}
