# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=iyfct-git
pkgver=1.02.r0.g7f40df1
pkgrel=1
pkgdesc="In Your Face City Trains - survive as long as you can (development version)"
arch=('any')
url="http://simonlarsen.github.io/2011/05/29/in-your-face-city-trains.html"
license=('CCPL:by' 'GPL3')
depends=('love')
makedepends=('zip')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=("git+https://github.com/SimonLarsen/iyfct.git"
        "iyfct.sh")
sha256sums=('SKIP'
            '89a21553f5a47f1a5d43a32eafb4261e5fc169292319214d68d9748f25f08e28')

pkgver() {
  cd iyfct
  git describe --long --tags | sed -r 's/^v//;s/-/.r/;s/-/./'
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
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
