# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.5.14
pkgrel=1
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c32eedf6a4080cbe221c902cf7f63b1668b3927edfc448d963d69ed66c8ec2fb')

build() {
  mkdir -p "${srcdir}/go/src/github.com/zquestz"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/zquestz/s"
  cd "$GOPATH/src/github.com/zquestz/s"

  go get -u github.com/FiloSottile/gvt
  $GOBIN/gvt restore

  go build .
}

package() {
  cd "${srcdir}/go/src/github.com/zquestz/s"

  install -Dm 775 "s" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "autocomplete/s-completion.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/s"
}
