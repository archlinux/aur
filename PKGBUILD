# Maintainer: Duarte David <deltaduartedavid@gmail.com>

pkgname='lego-git'
pkgrel=1
pkgver=f5d538c 
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://github.com/xenolf/lego'
arch=('x86_64' 'i686')
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_gourl=github.com/xenolf/lego

depends=()
makedepends=('git' 'go')

prepare() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -u -d ${_gourl}
}

pkgver() {
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go install -v ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/lego" "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/src/${_gourl}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
