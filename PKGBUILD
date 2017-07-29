pkgname=libunarr-git
pkgver=r190.d1be8c4
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/zeniko/unarr"
license=("LGPL3")
pkgdesc="A lightweight decompression library with support for rar, tar and zip archives."
source=('git+https://github.com/zeniko/unarr'
		'CMakeLists.txt'
		)
makedepends=('cmake' 'git')
depends=('zlib' 'bzip2')

pkgver() {
  cd "${srcdir}/unarr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/unarr"
  cp ../CMakeLists.txt .
}

build() {
  cd "${srcdir}/unarr"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/unarr"
  make DESTDIR=$pkgdir install
}
md5sums=('SKIP'
         '6c8ee9f142ac9b08eb43eb6faaf65594')
