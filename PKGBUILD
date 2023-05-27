# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >
pkgname=video-downloader
pkgver=0.12.4
pkgrel=1
pkgdesc="Download videos from websites like YouTube and many others (based on yt-dlp)"
arch=('any')
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('ffmpeg' 'libadwaita' 'python-brotli' 'python-gobject' 'python-mutagen'
         'python-pycryptodomex' 'python-pyxattr' 'python-websockets' 'yt-dlp')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35869cb60ae7194226063f2ce1281c8d9185a7d5cfc2a3b43935c27bb49c38ec')

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
