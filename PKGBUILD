# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname=juffed
pkgname=${_pkgname}-qt5-git
pkgver=0.10.95.g8106b7d
pkgrel=1
pkgdesc='A lightweight cross-platform text editor. Development version.'
arch=('i686' 'x86_64')
url='https://gitlab.com/stefanhusmann/juffed-qt5'
license=('GPL2')
depends=('enca' 'qscintilla-qt5')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-plugins=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("git+$url.git") 

sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags 2>/dev/null | sed -r 's/^juffed-//;s/-/./g'
}

build() {
  [[  -d "$srcdir"/build ]] || mkdir -p "$srcdir"/build
  cd "$srcdir"/build
  cmake ../${_pkgname} \
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
