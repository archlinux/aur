# Maintainer: Tomasz Kalisiak <tomasz.kalisiak3@gmail.com>

pkgname=qt6-interfaceframework
_pkgver=6.10.0
pkgver=${_pkgver/-/}
pkgrel=1
arch=(x86_64)
url='https://www.qt.io'
license=(GPL-3.0-only
         LGPL-3.0-only
         LicenseRef-Qt-Commercial
         Qt-GPL-exception-1.0)
pkgdesc='Tools and core APIs for implementing Middleware APIs, Middleware Back ends, and Middleware Services'
depends=(gcc-libs
         glibc
         qt6-base)
makedepends=(cmake
             git
             ninja
             python3
             python-virtualenv)
groups=(qt6)
_pkgfn=${pkgname/6-/}
source=(git+https://code.qt.io/qt/$_pkgfn#tag=v$_pkgver)
sha256sums=('8362426fffe01ac83c3b6152ee51afbe02a3406fb1b460bc4323700bc5cb4777')

build() {
  cmake -B build -S $_pkgfn -G Ninja \
    -DCMAKE_MESSAGE_LOG_LEVEL=STATUS \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt6-base "$pkgdir"/usr/share/licenses/$pkgname
}
