pkgname=video-downloader
pkgver=0.9.4
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/video-downloader"
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'libhandy' 'python-gobject' 'python-mutagen' 'python-pycryptodomex' 'python-pyxattr' 'python-websockets' 'yt-dlp')
makedepends=('git' 'meson')
_commit=da1c4d2b2a0965345b25d33af896010e57dd4229 # tags/0.9.4
source=("git+https://github.com/Unrud/${pkgname}.git/#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson ${pkgname} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
