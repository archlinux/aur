# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=trizbort-qt
pkgver=1.0
pkgrel=1
pkgdesc="C++/Qt port of Trizbort, an interactive fiction Mapper"
arch=("x86_64")
url="https://jxself.org/trizbort-qt.shtml"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake')
provides=("trizbort-qt")
source=("https://jxself.org/${pkgname}-${pkgver}.tar.gz" "qstring.patch")
sha256sums=("69950425e4ff9410e2fe5d6b54252b68f8f700053bd90cd2b7d86325a5a401cc" "d730f690ccb795c99c07718011739701fb01b72ca9555557c4fd32070a2b7f65")

prepare() {
	cd "$pkgname-$pkgver"
	# qstring patch from awesomeadam12345
	#patch -p1 -i "../qstring.patch"
}

build() {
  local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-author
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
