# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr-git
pkgver=1.0.1.r0.gb57ee2a
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=('git+https://github.com/selmf/unarr')
makedepends=('cmake' 'git')
depends=('zlib' 'bzip2' 'xz')
provides=('libunarr')

md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/unarr"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/unarr"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/unarr"
  make DESTDIR=$pkgdir install
}
