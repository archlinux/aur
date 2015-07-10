pkgname=libunarr-git
pkgver=r189.91c3eb5
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/zeniko/unarr"
pkgdesc=('A lightweight decompression library with support for rar, tar and zip archives.')
source=('git+https://github.com/zeniko/unarr'
		'https://raw.githubusercontent.com/selmf/unarr/master/CMakeLists.txt'
		)
makedepends=('cmake' 'git')

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
         '056fd95cfab5889c591f1ee53d389a97')
