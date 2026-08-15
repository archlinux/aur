# Maintainer: itachi_re <xanbenson99@gmail.com>
pkgname=yuki-iptv
pkgver=260815.6
pkgrel=1
pkgdesc="IPTV player with EPG support, based on mpv and Qt"
arch=('any')
url="https://github.com/itachi-re/yuki-iptv"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-pyqt6'
  'mpv'
  'python-requests'
  'python-unidecode'
  'python-orjson'
  'ttf-font'
  'xdg-utils'
)
optdepends=(
  'yt-dlp: playback of yt-dlp-supported stream URLs'
  'ffmpeg: recording support'
)
makedepends=('make' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/itachi-re/yuki-iptv/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55633a26127b0c0ecb751af54136f556ef17ff3de38bdc2a10cd5bd2f07c1adf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -a usr "$pkgdir/"
  find "$pkgdir" -type f -exec sed -i "s/__DEB_VERSION__/$pkgver/g" {} +
}
