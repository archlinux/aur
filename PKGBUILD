# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdebase
pkgver=1.1.2
pkgrel=6
pkgdesc="Historical copy of the base applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/kde1-kdebase"
license=("GPL2")
groups=('kde1')
depends=('qt1' 'kde1-kdelibs' 'libjpeg' 'libtiff' 'perl' 'pulseaudio' 'glu' 'libxpm')
makedepends=('cmake')
_commit="849cc4d1ad30e8d5881b2a7bf42d9c3c2c41e173"
source=("https://invent.kde.org/historical/$pkgname/-/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('e23ee724c1baa298acd3fd30acf182b2b6ac142158ff5aa3092a8cd615f384007a0df90cc6c47520223943cf860b19cc153bb5428ba7f2f425c7e5fa80283c90')

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake ../$pkgname-$_commit \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd ../$pkgname-$_commit
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
