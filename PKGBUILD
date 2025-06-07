# Maintainer: willemw <willemw12@gmail.com>

pkgname=media-downloader-git
pkgver=5.4.0.r10.g18adeee
pkgrel=2
pkgdesc='GUI front-end for downloading media files (yt-dlp, gallery-dl, lux-dl, you-get, svtplay-dl, aria2c, wget, safari books)'
arch=(x86_64)
url=https://github.com/mhogomchungu/media-downloader
license=(GPL-2.0-or-later GPL-3.0-or-later)
depends=(qt6-base)
makedepends=(cmake git)
optdepends=(
  'aria2: download plugin'
  'atomicparsley: for metadata download (for yt-dlp)'
  'ffmpeg: for media file post-processing' # extensions/yt-dlp-ffmpeg.json
  'gallery-dl: download plugin'
  'lux-dl: download plugin'
  'python-mutagen: for metadata download (for yt-dlp)'
  'svtplay-dl: download plugin'
  'wget: download plugin'
  'you-get: download plugin'
  'yt-dlp: download plugin')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname -DBUILD_WITH_QT6=1 -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
