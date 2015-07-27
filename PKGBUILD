# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=dh-make-golang
pkgver=0.0git20150727.0.3f59ff12f2
pkgrel=1
pkgdesc="debianize go library packages"
arch=('x86_64' 'i686')
url=https://github.com/Debian/dh-make-golang
license=('BSD')
makedepends=('go')
options=('!strip' '!emptydirs')
source=(
	"git+https://github.com/Debian/dh-make-golang.git#commit=3f59ff12f284fea0c66b81062a02f34cb0992061"
	"http://ftp.debian.org/debian/pool/main/d/dh-make-golang/dh-make-golang_0.0~git20150726.0.fc4210a-1.debian.tar.xz"
	)
sha256sums=('SKIP'
            '048e1ea8219781b6ae37ce9373605e9b9ce7ad847e6f231f9b1198ebeca50440')

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
