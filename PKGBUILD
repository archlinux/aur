_pkgname=video-downloader
pkgname=${_pkgname}-git
pkgver=0.9.4+4+g4ebde00
pkgrel=1
pkgdesc="GTK application to download videos from websites like YouTube and many others (based on youtube-dl)"
arch=(any)
url="https://github.com/Unrud/${_pkgname}"
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'libhandy' 'python-gobject' 'python-mutagen' 'python-pycryptodomex' 'python-pyxattr' 'python-websockets' 'yt-dlp')
makedepends=('git' 'meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/Unrud/${_pkgname}.git")
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
