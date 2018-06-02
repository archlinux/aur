# Maintainer:
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=miam-player
pkgver=0.8.0
pkgrel=4
pkgdesc="Cross-platform open source music player"
arch=('x86_64')
url="https://github.com/MBach/Miam-Player"
license=('GPL3')
depends=('qtav' 'qt5-multimedia' 'qt5-x11extras' 'taglib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MBach/Miam-Player/archive/v$pkgver.tar.gz"
        "fix-build.patch")
sha256sums=('598355e2eaee42878ce797186fc1ff9b8dd8aa11019ba58763f79b9d1d34538b'
            'a396c174bd40219de91e8d078777f8e5876f7e8030724c74a8b81a5246177e07')

prepare() {
  cd Miam-Player-$pkgver
  patch -Np1 -i ../fix-build.patch
}

build() {
  cd Miam-Player-$pkgver
  qmake-qt5
  make
}

package() {
  cd Miam-Player-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
