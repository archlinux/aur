# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=5
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdebase"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs" "libjpeg" "libtiff" "perl")
makedepends=("cmake")
_commit="a40a9a0de966d1831688bb9371a3c165b825bc7e"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz")
sha256sums=('a368f1294edafcae10a78fb5c0694dbcd38ae65379813bac67c2afda66390e6a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$_commit -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  cd $pkgname-$_commit
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
