# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=girens
pkgver=1.1.9
pkgrel=1
pkgdesc="Girens is a Plex GTK client for playing movies, TV shows and music from your Plex library"
arch=('any')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL3')
depends=('mpv' 'plex-remote' 'python-plexapi' 'libass' 'libhandy' 'fribidi' 'ffmpeg' 'python-mpv' 'python-idna' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-requests' 'python-tqdm' 'python-six' 'python-websocket-client')
makedepends=('meson')
source=("https://gitlab.gnome.org/tijder/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('SKIP') #autofill using updpkgsums

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