# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=girens-git
pkgver=1.1.9.r3.gd3d27c2
pkgrel=1
pkgdesc="Girens is a Plex GTK client for playing movies, TV shows and music from your Plex library"
arch=('x86_64')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL3')
depends=('mpv' 'plex-remote' 'python-plexapi' 'libass' 'libhandy' 'fribidi' 'ffmpeg' 'python-mpv' 'python-idna' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-requests' 'python-tqdm' 'python-six' 'python-websocket-client')
makedepends=('git' 'meson' 'python')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
