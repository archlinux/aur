# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>

pkgname=syntax-highlighting-git
pkgver=v5.30.0.rc1.r720.g7f57f9c
pkgrel=2
pkgdesc='Syntax highlighting engine for structured text and code'
arch=(x86_64)
url='https://projects.kde.org/projects/kde/syntax-highlighting'
license=(LGPL)
depends=(qt5-base)
makedepends=(git extra-cmake-modules-git)
source=('git+https://github.com/KDE/syntax-highlighting.git')
provides=(syntax-highlighting)
conflicts=(syntax-highlighting)
groups=(plasma)
md5sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../syntax-highlighting \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
 
