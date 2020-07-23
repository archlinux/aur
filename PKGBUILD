# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=floodlight-presenter
pkgver=0.10.1
pkgrel=1
pkgdesc="Presentation and lyrics program for churches to display lyrics and media"
arch=(x86_64)
url="https://floodlight.gitlab.io/"
license=(GPL3)
depends=(gtk3 gst-plugins-base json-glib libgee libsoup)
makedepends=(git meson vala)
checkdepends=()
optdepends=()
_commit=fee21a13812461a18c4a6db8839ce2a8a278429e  # tags/0.10.1
source=("git+https://gitlab.com/floodlight/presenter.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd presenter
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd presenter
}

build() {
  arch-meson presenter build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
