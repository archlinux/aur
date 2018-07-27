# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $	
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=kvkbd
pkgver=0.7.2
pkgrel=3
pkgdesc="A virtual keyboard for KDE"
arch=(x86_64)
url="https://www.linux-apps.com/p/1153489/"
license=(GPL)
depends=(kdebase-runtime)
makedepends=(cmake automoc4 docbook-xsl)
git_commit=5a2c62ff3f880314ec0f25a0424a23b5e886633b
source=("https://github.com/KDE/kvkbd/archive/$git_commit.zip")
md5sums=('24ca1b311549131922cc73a6de8b9eda')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$git_commit \
	-DQT_QMAKE_EXECUTABLE=qmake-qt4 \
	-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
