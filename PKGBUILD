# Maintainer: Masaki Komagata <komagata@gmail.com>

pkgname=mugvideo-git
pkgver=0.2.0.r7.gd900768
pkgrel=1
pkgdesc="Small GTK4 app for recording short selfie videos"
arch=('x86_64')
url="https://github.com/komagata/mugvideo"
license=('custom')
depends=(
  'gtk4'
  'gstreamer'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-libav'
  'wl-clipboard'
)
makedepends=('git' 'pkgconf')
provides=('mugvideo')
conflicts=('mugvideo')
source=('git+https://github.com/komagata/mugvideo.git')
sha256sums=('SKIP')

pkgver() {
  cd mugvideo
  printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mugvideo
  make
}

package() {
  cd mugvideo
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir/usr/share/doc/mugvideo/README.md"
}
