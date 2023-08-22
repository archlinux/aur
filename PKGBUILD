# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clsync
pkgver=0.4.5
pkgrel=2
pkgdesc='File live sync daemon based on inotify/fanotiry/kqueue written in GNU C'
arch=(x86_64)
url=https://ut.mephi.ru/oss/clsync
license=(GPL3)
makedepends=(doxygen graphviz libcgroup-git mhash)    # libcgroup
source=("$pkgname-$pkgver.tar.gz::https://github.com/clsync/clsync/archive/v$pkgver.tar.gz")
sha256sums=('dcf6e45914edac00c660942594f0c8958c6c7b9819c11277b7d9eb596f52cb81')

build() {
  cd $pkgname-$pkgver
  autoreconf -fi
  # Same options as in Debian
  ./configure --prefix=/usr --enable-socket --enable-socket-library --enable-highload-locks --disable-seccomp
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
}
