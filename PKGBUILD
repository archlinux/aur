# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
pkgname=video-downloader
pkgver=0.12.17
pkgrel=1
pkgdesc="Download videos from websites like YouTube and many others (based on yt-dlp)"
arch=('any')
url="https://github.com/Unrud/video-downloader"
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'libadwaita'
  'python-brotli'
  'python-gobject'
  'python-mutagen'
  'python-pycryptodomex'
  'python-pyxattr'
  'python-websockets'
  'yt-dlp'
)
makedepends=('meson')
checkdepends=('appstream-glib' 'flake8')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4cf4ab2bf76589c1dbc0bd5ca448f7b1dc8fd2b4de521378327988bdf5119579')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
