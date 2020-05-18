# Maintainer: Famiu Haque <famiuhaque@gmail.com>

pkgname=docopt.cpp-static-git
pkgver=0.6.2.r104.42ebcec
pkgrel=1
pkgdesc="C++11 port of docopt (with static libraries)"
arch=('i686' 'x86_64')
url="https://github.com/docopt/docopt.cpp/"
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('docopt' 'docopt.cpp')
provides=('docopt.cpp')
source=("git://github.com/docopt/docopt.cpp.git")
options=('staticlibs')
sha512sums=('SKIP')

pkgver()
{
  cd docopt.cpp
  echo "0.6.2.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare()
{
  mkdir -p build
}

build()
{
  cd build
  cmake ../docopt.cpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package()
{
  make -C build DESTDIR="${pkgdir}" install
  cd docopt.cpp
  install -Dm644 LICENSE-MIT ${pkgdir}/usr/share/licenses/docopt.cpp-static-git/LICENSE
}
