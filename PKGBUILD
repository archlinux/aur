# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=cura-plugin-octoprint-git
_pkgname=cura-plugin-octoprint
pkgver=r216.79ae28b
pkgrel=1
pkgdesc="Cura plugin which enables printing directly to OctoPrint and monitoring the progress"
arch=('any')
license=('GPL3')
url="https://github.com/fieldofview/OctoPrintPlugin"
depends=('python' 'cura' 'python-zeroconf')
makedepends=('git' 'cmake')
source=("$_pkgname::git+https://github.com/fieldofview/OctoPrintPlugin.git#branch=master")
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
