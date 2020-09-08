pkgname=blanket-git
_pkgname=blanket
pkgver=0.2.0.r54.gec7bc31
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
url="https://github.com/rafaelmardojai/blanket"
arch=(x86_64)
license=(GPL2)
depends=('python' 'python-gobject' 'gtk3' 'libhandy' 'gstreamer')
makedepends=('git' 'meson')
provides=('blanket')
conflicts=('blanket')
source=("git+https://github.com/rafaelmardojai/blanket.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
