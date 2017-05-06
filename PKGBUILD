# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=s
pkgver=0.5.10
pkgrel=3
pkgdesc="Web search from the terminal. Supports over 50 providers including google, github, and stackoverflow."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/s"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("s=${pkgver}")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8a5ba823d02f495dd1bb150882ddccd2bb082efff4c996b9b43e4cd5599d3df2')

build() {
  cd "$pkgname-$pkgver"

  go get -u github.com/FiloSottile/gvt
  gvt restore

  go build .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 775 "$pkgname-$pkgver" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "autocomplete/s-completion.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/s"
}
