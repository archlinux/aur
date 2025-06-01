
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded-docklet-lastfm-git
pkgver=0.1.0.r0.gf4b51fd
pkgrel=1
pkgdesc='Last.fm docklet for Plank Reloaded'
arch=('x86_64')
url='https://github.com/zquestz/lastfm-docklet'
license=('GPL3')
depends=('plank' 'libsoup3' 'json-glib')
makedepends=('gnome-common' 'git' 'intltool' 'vala' 'meson' 'ninja')
source=('git+https://github.com/zquestz/lastfm-docklet.git')
sha256sums=('SKIP')

pkgver() {
  cd lastfm-docklet
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd lastfm-docklet
  meson setup --prefix=/usr build
}

build() {
  cd lastfm-docklet
  meson compile -C build
}

package() {
  cd lastfm-docklet
  meson install --destdir="${pkgdir}" -C build
}

# vim: ts=2 sw=2 et:
