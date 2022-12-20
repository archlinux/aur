# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=morty-git
pkgver=0.2.0.r62.gf5bff1e
pkgrel=1
pkgdesc='Privacy aware web content sanitizer proxy as a service'
arch=(x86_64)
url='https://github.com/asciimoo/morty'
license=(AGPL3)
provides=(morty)
conflicts=(morty)
makedepends=(git go)
source=(git+$url
        morty.service)
b2sums=('SKIP'
        '0ff38b767a115ae226c7339d66213246b1970a5ddba0412a4d709be391f3ce8e63c9164428dc5c8a44c04e0f3c83a3cf09291df0cd54375026794fed1164cc37')

pkgver() {
  cd morty
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

build(){
    cd morty
    go build -o morty .
}

check() {
  cd morty
  go test
}

package() {
  install -Dm644 morty.service -t "$pkgdir"/usr/lib/systemd/system
  cd morty
  install -Dm755 morty -t "$pkgdir"/usr/bin
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/morty
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/morty
}
