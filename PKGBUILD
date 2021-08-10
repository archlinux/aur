# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=girens
pkgver=1.1.9
pkgrel=2
pkgdesc="Girens is a Plex GTK client for playing movies, TV shows and music from your Plex library"
arch=('x86_64')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL3')
depends=('mpv' 'plex-remote' 'python-plexapi' 'libass' 'libhandy' 'fribidi' 'ffmpeg' 'python-mpv' 'python-idna' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-requests' 'python-tqdm' 'python-six' 'python-websocket-client')
makedepends=('meson' 'python')
source=("https://gitlab.gnome.org/tijder/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d7c2275eb61a963a0a04782d8088896980bbc57a3fd00383df906e72dea847a4')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}