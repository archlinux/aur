# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdoctools-git
pkgver=v5.2.0.r384.g8b6ec34
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
source=('git+https://github.com/KDE/kdoctools.git')
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
