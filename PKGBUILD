# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdoctools-git
pkgver=v5.2.0.r370.g70832b7
pkgrel=1
pkgdesc='KDocTools'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdoctools'
license=(LGPL)
depends=(karchive-git docbook-xsl)
makedepends=(extra-cmake-modules-git git perl-uri)
conflicts=(kdoctools)
provides=(kdoctools)
options=(staticlibs)
source=('git://anongit.kde.org/kdoctools.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdoctools \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
