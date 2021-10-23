pkgname=blanket-git
_pkgname=blanket
pkgver=0.5.0.r18.g3593315
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
url="https://github.com/rafaelmardojai/blanket"
arch=(x86_64)
license=(GPL2)
depends=('gstreamer' 'gtk4' 'libadwaita' 'python' 'python-gobject')
makedepends=('git' 'meson')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/rafaelmardojai/blanket.git")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_pkgname} build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
