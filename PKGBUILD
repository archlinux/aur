# Maintainer: sfslinux@gmail.com

_pkgname=screentest
pkgname=$_pkgname-git
pkgver=r89.ae99889
pkgrel=1
pkgdesc="Tesing the quality of CRT/LCD screens"
arch=('x86_64')
#url="https://github.com/TobiX/screentest"
url="https://github.com/sfs-pra/screentest"
license=('GPL2')
depends=('gtk3' )
makedepends=('meson')
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  meson build --prefix /usr 
  meson compile -C build
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
}
