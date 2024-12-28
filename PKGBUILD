# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
pkgname=video-downloader
pkgver=0.12.21
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
sha256sums=('f9c4ea71e8290ed54fdfd5f7f6d69cb095eae9bce4f3f6b99c8ca2b47a99821f')

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
