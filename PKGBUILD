# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil-git
pkgver=1.10.2.r1.gb0c0a29
pkgrel=1
pkgdesc="A simple music browser for MPD (git version)"
arch=('any')
license=('GPL3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2>=3.1' 'gtk3' 'python-gobject' 'python-cairo')
makedepends=('git' 'meson')
provides=('mpdevil')
conflicts=('mpdevil')
source=('git+https://github.com/SoongNoonien/mpdevil.git')
md5sums=('SKIP')
_gitname="mpdevil"

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

