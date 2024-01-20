# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=girens
pkgver=2.0.3
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
  'python-six'
  'python-tqdm'
  'python-urllib3'
  'python-websocket-client'
)
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=55f5ecc0d7b259929857019952ee133080e87433  # 2.0.3
source=("git+https://gitlab.gnome.org/tijder/girens.git#commit=$_commit")
sha256sums=('SKIP')

#pkgver() {
#  cd $pkgname
#  git describe --tags | sed 's/^v//;s/-/+/g'
#}

build() {
  arch-meson "$pkgname" build --libdir=lib
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
