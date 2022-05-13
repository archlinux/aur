# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >

pkgname=video-downloader
pkgver=0.9.7
pkgrel=1
pkgdesc='GTK application to download videos from websites like YouTube and many others (based on yt-dlp)'
arch=('any')
url="https://github.com/Unrud/${pkgname}"
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'libhandy' 'python-gobject' 'python-mutagen' 'python-pycryptodomex' 'python-pyxattr' 'python-websockets' 'yt-dlp')
makedepends=('git' 'meson')
source=("git+${url}.git#tag=v${pkgver}")
b2sums=('SKIP')

prepare() {
  arch-meson ${pkgname} build
}

build() {
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
