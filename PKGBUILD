# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=girens
pkgver=2.0.10
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
  'org.freedesktop.secrets'
  'python-cairo'
  'python-certifi'
  'python-chardet'
  'python-charset-normalizer'
  'python-gobject'
  'python-plexapi'
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
sha256sums=('f5eff3866b3bc4b0cbedb24169c698a8005b996937f2c9ca4c0b8c15370cb5b4')

build() {
  arch-meson "$pkgname" build --libdir=lib -Dnetwork_tests=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
