# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=ffmpeg-audio-thumbnailer
pkgname=$_pkgname-git
pkgver=r9.68ab554
pkgrel=2
pkgdesc="A minimal audio file thumbnailer for file managers, such as nautilus, dolphin, thunar, and nemo."
url="https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer"
arch=(any)
depends=('ffmpeg')
license=('GPL3 or any later version')
provides=('ffmpeg-audio-thumbnailer')
conflicts=('ffmpeg-audio-thumbnailer')
conflicts+=('ffmpegthumbnailer-mp3') # The files don't conflict, but the functions do (this package does it better ;) )
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
