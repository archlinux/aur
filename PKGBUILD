# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
pkgname=video-downloader
pkgver=0.12.10
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
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df08bca47b40ba06a0ddb7e8904408f068be7582d927a26e02cbf75611b88d2d')

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
