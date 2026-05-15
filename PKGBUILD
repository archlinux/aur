# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=girens
pkgver=2.0.9
pkgrel=1
pkgdesc="A Plex GTK client for playing movies, TV shows and music from your Plex library."
arch=('any')
url="https://gitlab.gnome.org/tijder/girens"
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
  'fribidi'
  'gstreamer'
  'gtk4'
  'libadwaita'
  'libass'
  'libplacebo'
  'libsecret'
  'python-cairo'
  'python-certifi'
  'python-chardet'
  'python-charset-normalizer'
  'python-gobject'
  'python-plexapi>=4.18.1'
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
sha256sums=('46b90e06befe0f3119d62a971495413b19197ab536d3aac17467e036d1c142d9')

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
