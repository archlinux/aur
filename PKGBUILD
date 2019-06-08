# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=juffed-qt5-git
pkgver=0.11
pkgrel=1
pkgdesc='A lightweight cross-platform text editor. Development version.'
arch=('i686' 'x86_64')
url='https://gitlab.com/stefanhusmann/juffed-qt5'
license=('GPL2')
depends=('enca' 'qscintilla-qt5')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("juffed=${pkgver}" "juffed-plugins=${pkgver}")
conflicts=('juffed' 'juffed-plugins')
source=("git+$url.git") 
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags  | tr - .
}

build() {
  [[  -d "$srcdir"/build ]] || mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  cmake ../${pkgname%-git} \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DLIB_INSTALL_DIR:PATH=/usr/lib \
	-DUSE_ENCA:BOOL=ON
  make
}

package() {
  # Installing package
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}
