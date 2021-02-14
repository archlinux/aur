# Maintainer: willemw <willemw12@gmail.com>

pkgname=media-downloader-git
pkgver=1.0.0.r61.gdbc8459
pkgrel=1
pkgdesc="GUI front-end for downloading media files (youtube-dl, ...)"
arch=('x86_64')
url='https://github.com/mhogomchungu/media-downloader'
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
optdepends=('youtube-dl: download files' 'wget: download files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  rm -rf build
  mkdir build
}

build() {
  cd $pkgname/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release ..
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir/" install
}

