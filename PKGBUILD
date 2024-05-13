# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=plattenalbum-git
pkgver=2.1.0.r3.gf0d4593
pkgrel=1
pkgdesc="Browse music with MPD"
arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/SoongNoonien/plattenalbum"
depends=('python-mpd2>=3.1' 'gtk4' 'python-gobject' 'libadwaita')
makedepends=('git' 'meson' 'gettext' 'glib2')
provides=('plattenalbum' 'mpdevil' 'mpdevil-git')
conflicts=('plattenalbum' 'mpdevil-git')
source=('git+https://github.com/SoongNoonien/plattenalbum.git')
md5sums=('SKIP')
_gitname="plattenalbum"

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_gitname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

