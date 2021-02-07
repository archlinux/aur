pkgname=video-downloader
pkgver=0.7.0
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git' 'meson')
_commit=395ba1c025c7e51afcaac056af61926a7f1ed778 # tags/0.7.0
source=("git+https://github.com/Unrud/video-downloader.git/#commit=$_commit")
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
