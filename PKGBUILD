# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=5.6.2
pkgrel=2
pkgdesc="A free program for learning music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/"
license=('GPL')
depends=('portmidi' 'wxgtk2' 'sqlite3' 'fluidsynth' 'soundfont-fluid')
optdepends=('timidity++: for sound without external midi player')
makedepends=('unittestpp' 'cmake>=3.1')

source=("https://github.com/lenmus/lenmus/archive/Release_${pkgver}.tar.gz")
sha256sums=('72af23c1f5d4b543cece326b50d7e8b9fb1f9da8e64e7ec65e6f88c2c3c77c6c')

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build

  cd build
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname}-Release_${pkgver}/"

  make -j$(nproc) || return 1
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install
}
