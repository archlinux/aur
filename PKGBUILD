# Maintainer: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: murchik <mixturchik@gmail.com>
pkgname=submarine
pkgver=0.1.5
pkgrel=2
epoch=1
pkgdesc="Command-line program for searching and downloading the right subtitles for movies"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/rastersoft/$pkgname"
depends=('glib2' 'libgee' 'libsoup' 'libarchive' 'unzip')
makedepends=('vala' 'git' 'cmake')
optdepends=('imagemagick: for external commands'
        'libjpeg-turbo: for external commands'
        'gimp: open with')
provides=('submarine')
conflicts=('submarine')
source=("https://github.com/rastersoft/$pkgname/archive/$pkgver.tar.gz")
md5sums=('b42757fed480a8d56812348f125a316a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ ! -d build ]] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../doc/submarine.man" "${pkgdir}/usr/share/man/man1/$pkgname.1"
}

