# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fac
pkgver=2.0.0
pkgrel=1
pkgdesc="Easy-to-use command line tool for fixing git conflicts"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mkchoi212/fac"
license=('MIT')
options=('!strip' '!emptydirs')
makedepends=(
  'git'
  'go'
)
source=("https://github.com/mkchoi212/fac/archive/v${pkgver}.tar.gz")
sha256sums=('0680c5f3984a6fd4a2bb79a7a527585b4beb93a29adbf1f277d2f79e0a28e227')

prepare(){
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/mkchoi212/fac"
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/color" ] || mv "$srcdir/$pkgname-$pkgver/color" "$GOPATH/src/github.com/mkchoi212/fac"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/conflict" ] || mv "$srcdir/$pkgname-$pkgver/conflict" "$GOPATH/src/github.com/mkchoi212/fac"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/editor" ] || mv "$srcdir/$pkgname-$pkgver/editor" "$GOPATH/src/github.com/mkchoi212/fac"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/binding" ] || mv "$srcdir/$pkgname-$pkgver/binding" "$GOPATH/src/github.com/mkchoi212/fac"
  go get -d
}


build() {
  export GOPATH="$srcdir/go"
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o "${pkgname}" .
}

package() {
  _output="${srcdir}/$pkgname-$pkgver"
  install -Dm755 "${_output}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install manpage
  install -Dm644 "${_output}/assets/doc/fac.1" "${pkgdir}/usr/share/man/man1/fac.1"
}
