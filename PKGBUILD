# Maintainer: Otto Naderer <otto.naderer@openmailbox.org>
pkgname=neucoin-git
pkgver=3043.527f0bd
pkgrel=1
pkgdesc="A proof-of-stake based digital currency (git version)"
arch=(i686 x86_64)
url="https://github.com/NeuCoin/neucoin"
license=('mit')
groups=()
depends=(boost db openssl qrencode libpng qt5-base qt5-tools)
makedepends=(git)
source=("git://github.com/NeuCoin/neucoin.git")
md5sums=("SKIP")

_gitname=neucoin

build() {
  cd "$srcdir/$_gitname/src"
  make -f Makefile.unix all
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin/"
  pwd
  install src/neucoind "$pkgdir/usr/bin"
  install src/neucoin-qt "$pkgdir/usr/bin"
}

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

