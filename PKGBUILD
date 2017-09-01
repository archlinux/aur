# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=libunarr-git
pkgver=r214.65e7b2c
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/selmf/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=('git+https://github.com/selmf/unarr')
makedepends=('cmake' 'git')
depends=('zlib' 'bzip2' 'xz')

md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/unarr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/unarr"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:STRING=/usr/lib
  make
}

package() {
  cd "${srcdir}/unarr"
  make DESTDIR=$pkgdir install
}
