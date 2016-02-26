# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Chris Chapman <chris dot chapman at aggiemail dot usu dot edu>

pkgname=lenmus
pkgver=5.4.1
pkgrel=7
pkgdesc="A free program to learn music"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/phonascus/intro"
license=('GPL')
depends=('portmidi' 'wxgtk' 'sqlite3' 'boost-libs')
optdepends=('timidity++: for sound without external midi player')
makedepends=('boost' 'unittestpp' 'cmake>=2.8')

source=("https://codeload.github.com/lenmus/lenmus/tar.gz/Release_${pkgver}")
md5sums=('cfa0956de368a7d7a252ccee51e414a7')

build() {
  cd "${srcdir}/${pkgname}-Release_${pkgver}"

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
