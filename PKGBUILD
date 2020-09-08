pkgname=video-downloader
pkgver=0.5.5
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=(gtk3 python-gobject youtube-dl)
makedepends=(git meson)
_commit=34092f6bb8bdd06b2bda8d27a6f979e864b6d3d9  # tags/0.5.5
source=("git+https://github.com/Unrud/video-downloader#commit=$_commit")
sha512sums=('SKIP')

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
