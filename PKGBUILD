# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-plugin-orientation-git
_pkgname=cura-plugin-orientation
pkgver=r143.bef126d
pkgrel=1
pkgdesc="A Cura plugin that allows you to quickly calculate and apply the best printable orientation."
arch=('any')
license=('GPL3')
url="https://github.com/nallath/CuraOrientationPlugin"
depends=('python' 'cura' 'python-zeroconf' 'python-numpy')
makedepends=('git' 'cmake')
source=("$_pkgname::git+https://github.com/nallath/CuraOrientationPlugin.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$_pkgname"/build
  cd "$_pkgname"/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
