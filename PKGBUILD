pkgname=libunarr-git
pkgver=r188.c4136ab
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/zeniko/unarr"
pkgdesc=('A lightweight decompression library with support for rar, tar and zip archives.')
source=('git+https://github.com/zeniko/unarr'
		'https://raw.githubusercontent.com/selmf/unarr/master/CMakeLists.txt'
		'fseeko.patch')
makedepends=('cmake' 'git')

pkgver() {
  cd "${srcdir}/unarr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/unarr"
  cp ../CMakeLists.txt .
  cp ../fseeko.patch .
  patch -p1 < fseeko.patch  
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
         '2a4efbaab8d331302cb3ae21c912a061'
         '128ad4e9ffc1019ec88f53d539921297')
