# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kdav
pkgname=${_name}5
pkgver=5.112.0
pkgrel=1
epoch=1
pkgdesc='A DAV protocol implemention with KJobs'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio5)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=("$_name<1:5.111")
replaces=("$_name<1:5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('4f8ca7f6a61fa911d924bd8d3999d20fa52075194c379964541e5cd39a56cbd4'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
