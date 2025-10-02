# Maintainer: Michał Walenciak <kicer86@gmail.com>
groups=('modified')

pkgname=media-downloader
pkgver=5.4.3
pkgrel=1
pkgdesc="A Qt/C++ front end to yt-dlp, youtube-dl, gallery-dl, lux, you-get, svtplay-dl, aria2c, wget and safari books."
arch=('x86_64')
url="https://github.com/mhogomchungu/media-downloader"
license=('GPL-2.0-only OR GPL-3.0-or-later')
depends=('qt6-base')
makedepends=('cmake')
optdepends=(
  'aria2: aria2c backend'
  'ffmpeg: video post-processing'
  'python-lxml: required for Safari books plugin'
  'python-requests: required for Safari books plugin'
  'svtplay-dl: svtplay-dl plugin'
  'wget: download regular large files'
  'python-mutagen'
)
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('876073dc574081baad6f6040e5696d9498fd69aedd01b1f246fe3407f7d450e3'
            'SKIP')
validpgpkeys=('6855E493B5B2DF96E319BB6D16E2E1ACC6F51242') # Francis Banyikwa (A key for signing packages) <banyikwafb@gmail.com>

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_WITH_QT6='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
