# Maintainer: willemw <willemw12@gmail.com>

pkgname=media-downloader-git
pkgver=2.5.0.r3.gb32364b
pkgrel=1
pkgdesc="GUI front-end for downloading media files (yt-dlp, youtube-dl, ...)"
arch=('x86_64')
url="https://github.com/mhogomchungu/media-downloader"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake' 'git')
optdepends=('aria2: download files'
            'wget: download files'
            'youtube-dl: download files'
            'yt-dlp: download files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}

