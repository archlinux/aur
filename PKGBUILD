# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=girens
pkgver=2.0.7
pkgrel=1
pkgdesc="A Plex GTK client for playing movies, TV shows and music from your Plex library."
arch=('any')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'fribidi'
  'libadwaita'
  'libass'
  'libsecret'
  'python-cairo'
  'python-certifi'
  'python-chardet'
  'python-charset-normalizer'
  'python-gobject'
  'python-plexapi-girens'
  'plex-remote'
  'python-idna'
  'python-mpv'
  'python-opengl'
  'python-requests'
  'python-tqdm'
  'python-urllib3'
  'python-websocket-client'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
checkdepends=(
  'appstream-glib'
)
source=("git+https://gitlab.gnome.org/tijder/girens.git#tag=v$pkgver")
sha256sums=('838792479631e7f243c0de8abd995a661fb5f22827d8e3a1fc8a69c196dcf203')

build() {
  arch-meson "$pkgname" build --libdir=lib
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
