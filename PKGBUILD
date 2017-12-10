# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Co-Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=azure-vhd-utils-git
pkgver=r7.d206e6d
pkgrel=1
pkgdesc="Azure VHD utilities for Go."
arch=('x86_64' 'i686')
url="https://github.com/Microsoft/azure-vhd-utils"
license=('MIT')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!emptydirs')

pkgver() {
  cd $srcdir/src/$_gourl/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="$srcdir"
  go get -fix -v -x ${url#https://}
}

package() {
  install -Dm755 $srcdir/bin/azure-vhd-utils "$pkgdir/usr/bin/vhd"
  install -Dm644 $srcdir/src/${url#https://}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
