# Maintainer: jmcb <joelsgp@protonmail.com>
# Contributor: Jacek Szafarkiewicz <szafar at linux dot pl>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-python
_name=kdev-python
pkgver=22.08.3
pkgrel=1
pkgdesc="Python language and documentation plugin for KDevelop"
arch=(x86_64)
url="http://www.kdevelop.org/"
license=(GPL)
depends=(kdevelop 'python<3.10')
makedepends=(extra-cmake-modules)
optdepends=('python-pycodestyle: for Python style checking')
groups=(kde-applications kdevelop)
source=(https://download.kde.org/stable/release-service/${pkgver}/src/${_name}-${pkgver}.tar.xz{,.sig})
sha256sums=('26952f6a73756dbe0acfe80aaea8e92c22afcd4174a23b29934019c94a608070'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>


# https://invent.kde.org/kdevelop/kdev-python/-/blob/master/INSTALL
build() {
  cd $_name-$pkgver
  cmake -B build -S . \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  cd $_name-$pkgver
  DESTDIR="$pkgdir" cmake --install build
}
