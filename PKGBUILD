pkgname=video-downloader-git
_pkgname=video-downloader
pkgver=0.6.1+14+gc50fb79
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git' 'meson')
provides=('video-downloader')
conflicts=('video-downloader')
source=("git+https://github.com/GustavoPeredo/video-downloader")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
