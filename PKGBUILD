# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=mpv-mpris-git
pkgver=1.1.1.g16fee38
pkgrel=1
pkgdesc="MPRIS plugin for mpv. (GIT version)"
arch=('x86_64')
license=('MIT')
url='https://github.com/hoyon/mpv-mpris'
depends=(
  'mpv'
  'ffmpeg' 'libavformat.so'
  'glibc' # libc.so
  'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
)
makedepends=('git')
checkdepends=(
  'jq'
  'playerctl'
  'socat'
  'sound-theme-freedesktop'
  'xorg-server-xvfb'
)
provides=('mpv-mpris')
conflicts=('mpv-mpris')
source=('git+https://github.com/hoyon/mpv-mpris.git')
sha256sums=('SKIP')
options=('debug')
install=mpv-mpris-git.install

pkgver() {
  cd mpv-mpris
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd mpv-mpris
  make
}

check() {
  cd mpv-mpris
  make test
}

package() {
  cd mpv-mpris
  install -Dm755 mpris.so "${pkgdir}/usr/share/mpv/scripts/mpris.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
