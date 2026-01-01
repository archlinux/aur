# Maintainer: SykikXO <sykik@example.com>
pkgname=fey
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="A high-performance, minimalistic Wayland image viewer with GIF and physics support"
arch=('x86_64')
url="https://github.com/SykikXO/fey"
license=('MIT')
depends=('cairo' 'wayland' 'exiv2' 'imlib2')
makedepends=('git' 'wayland-protocols')
provides=('fey')
conflicts=('fey')
source=("fey::git+https://github.com/SykikXO/fey.git")
md5sums=('SKIP')

pkgver() {
  cd "fey"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "fey"
  make
}

package() {
  cd "fey"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
