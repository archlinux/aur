# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
_baseversion=0.0
_debiangitsuffix=git20161120.0.71f5e23
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
source=("http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix.orig.tar.xz"
	"http://httpredir.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_$_baseversion~$_debiangitsuffix-$_debianpkgrel.debian.tar.xz")

sha256sums=('e5dddc76743a74666ddc74d33283bf4085eedb85fff41a6b42d9b7fac1f8f28b'
            '622fdf2e33c24620b30657c09235b9feb1a7307ac340344672ea68c137313cc7')

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
