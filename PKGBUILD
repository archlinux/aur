# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Co-Maintainer: Luca Weiss <WEI16416@spengergasse.at>

_pkgname=azure-vhd-utils
pkgname=${_pkgname}-git
pkgver=r36.43293b8
pkgrel=1
pkgdesc="Azure VHD utilities for Go."
arch=('x86_64' 'i686')
url="https://github.com/Microsoft/azure-vhd-utils"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/Microsoft/${_pkgname}

pkgver() {
  cd $srcdir/src/$_gourl/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="$srcdir"
  go get -fix -v -x ${_gourl}
}

package() {
  install -Dm755 $srcdir/bin/azure-vhd-utils "$pkgdir/usr/bin/vhd"
  install -Dm644 $srcdir/src/${_gourl}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
