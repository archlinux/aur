pkgname=video-downloader
pkgver=0.6.1
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git' 'meson')
_commit=1c2e24b049b23e0c595606abc1a37e2d750df3dc # tags/0.6.1
source=("git+https://github.com/GustavoPeredo/video-downloader#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
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
