# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor : Sascha Pfau <MrPeacock@gmail.com>

pkgname=simon
pkgver=0.4.1
pkgrel=3
pkgdesc="Open-source speech recognition program for replacing mouse and keyboard"
arch=('i686' 'x86_64')
url="http://simon.kde.org/"
license=('GPL')
depends=('portaudio' 'qwt' 'kdebase-runtime' 'kdepimlibs')
makedepends=('automoc4' 'cmake' 'flex' 'docbook-xml' 'boost')
optdepends=('htk: create and modify the speech models'
            'julius: for speech recognition')
install=$pkgname.install
source=(http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.bz2)
sha256sums=('8d55bc3f607a89e15efd51b844d93daf67d9967ad243f54efae324754859342d')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/build

  make DESTDIR="${pkgdir}" install
}
