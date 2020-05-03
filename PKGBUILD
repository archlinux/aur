# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
# Contributor: murchik <mixturchik@gmail.com>
pkgname=submarine
pkgver=0.1.7b
pkgrel=1
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
sha512sums=('3b59a125693dfbba78eb0dadc10b10c9484e59f33deb61d5007c5b4276b0952915f824a65b24ea369b068eb0ff59801b5fd9a619f47c3a50a4041fe0fab83047')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ ! -d build ]] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "../doc/submarine.man" "${pkgdir}/usr/share/man/man1/$pkgname.1"
}

