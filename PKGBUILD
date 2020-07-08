# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=video-downloader
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=(gtk3 python-gobject youtube-dl)
makedepends=(git meson)
_commit=ccbbf489cab31ecc606d1aaaf759bd2c349c4b02  # tags/0.3.1
source=("git+https://github.com/Unrud/video-downloader#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
