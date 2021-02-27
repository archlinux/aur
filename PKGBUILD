# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gopro-utils-git
_pkgname=gopro-utils
pkgver=r41.e0a6514
pkgrel=1
pkgdesc="Tools to parse metadata from GoPro Hero 5 & 6 cameras"
arch=('x86_64' 'i686')
url="https://github.com/mlouielu/gopro-utils"
license=('BSD')
makedepends=('go')
source=("${_pkgname}"::git+https://github.com/mlouielu/gopro-utils)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/"
  export GOPATH=`pwd`
  go get github.com/mlouielu/gopro-utils/bin/gopro2json
  go get github.com/mlouielu/gopro-utils/bin/gopro2gpx
}

package() {
  install -Dm755 "$srcdir/bin/gopro2gpx" "$pkgdir/usr/bin/gopro2gpx"
  install -Dm755 "$srcdir/bin/gopro2json" "$pkgdir/usr/bin/gopro2json"
}
