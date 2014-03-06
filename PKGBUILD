# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=iyfct-git
pkgver=r36.gae0aa39
pkgrel=1
pkgdesc="In Your Face City Trains - survive as long as you can (development version)"
arch=('any')
url="http://simonlarsen.github.io/2011/05/29/in-your-face-city-trains.html"
license=('CCPL:by' 'GPL3')
depends=('love08')
makedepends=('zip')
source=("git+https://github.com/SimonLarsen/iyfct.git"
        "iyfct.sh")
sha256sums=('SKIP'
            '8a10e898f242c6966a20ff1727dbbd4af2d30f870aa64d6b53e532b5845846f3')

pkgver() {
  cd iyfct
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd iyfct
  # generate love file
  rm -f iyfct.love
  zip -9 -q -r iyfct.love . -x ".git/*"
}

package() {
  cd iyfct

  # copy generated love package
  install -Dm644 iyfct.love "$pkgdir"/usr/share/iyfct/iyfct.love
  # launcher
  install -Dm755 ../iyfct.sh "$pkgdir"/usr/bin/iyfct
  # readme + license
  install -Dm644 README.textile "$pkgdir"/usr/share/doc/iyfct/README.textile
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
