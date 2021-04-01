pkgname=video-downloader
pkgver=0.7.4
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'youtube-dl')
makedepends=('git' 'meson')
_commit=e6812900dfd7da514117136ce691ba08849784cf # tags/0.7.4
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
