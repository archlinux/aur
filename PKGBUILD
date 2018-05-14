# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=fac
pkgver=1.1.0
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
sha256sums=('0a38e091686a5311565a0e47c60471c40dcb1ace5cc9a07588be67dfd82f1bb8')

prepare(){
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH/src/github.com/mkchoi212/fac"
  cd "${srcdir}/${pkgname}-${pkgver}"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/color" ] || mv "$srcdir/$pkgname-$pkgver/color" "$GOPATH/src/github.com/mkchoi212/fac"
  [ -d "$GOPATH/src/github.com/mkchoi212/fac/conflict" ] || mv "$srcdir/$pkgname-$pkgver/conflict" "$GOPATH/src/github.com/mkchoi212/fac"
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
