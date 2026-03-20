# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=libnuml
_name=NuML
pkgver=1.1.7
pkgrel=1
pkgdesc="Numerical Markup Language (NuML) for exchange and archiving of numerical results"
url="https://github.com/NuML/NuML"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('libsbml')
source=($_name-$pkgver.tar.gz::https://github.com/NuML/NuML/archive/v$pkgver.tar.gz)
sha256sums=('820d854355d80a3fe6dbe6c5428c45d42542541213cf0c3b3aee705f8ba1399f')

build() {
  cd "$srcdir"/$_name-$pkgver
  sed -i '/project(libnuml VERSION /{N;s/LANGUAGES CXX/LANGUAGES C CXX/;}' libnuml/CMakeLists.txt
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    $pkgname
  make
}

package() {
  cd "$srcdir"/$_name-$pkgver
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
}
