# Maintainer: Splith <spam at helper3000 net>

pkgname=swars
pkgver=0.3
pkgrel=1
pkgdesc="Syndicate Wars, a classic 1996 strategy game, with SDL patches to make it playable natively on Linux. Requires the Syndicate Wars CD to copy data files from before first run."
url="http://swars.vexillium.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=( 'lib32-sdl' 'lib32-libvorbis' 'lib32-libpng' 'lib32-zlib' 'lib32-openal' 'lib32-cdparanoia' )
makedepends=('python2')
source=("http://swars.vexillium.org/files/$pkgname-$pkgver.tar.bz2")
sha256sums=('01f44e5b792d41b138d361d04810a875cfa5f897c642a2b13d0dde633fabdacb')

prepare() {
  cd $pkgname-$pkgver

  if [ "${CARCH}" = "x86_64" ]; then
    ac_cv_prog_PYTHON=python2 ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" --prefix=/usr --libdir=/usr/lib32
  else
    ac_cv_prog_PYTHON=python2 ./configure --prefix=/usr
  fi

}

build() {
  cd $pkgname-$pkgver

  make
}

package () {
  install=swars.install
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  mkdir "${pkgdir}/usr/share/swars"
  install -Dm755 util/install "${pkgdir}/usr/share/swars/install"
}

