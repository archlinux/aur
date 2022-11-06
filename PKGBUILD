# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=gnome-developer-www
pkgver=340.64b8ac4
pkgrel=1
pkgdesc="GNOME development website"
arch=(any)
url="https://developer.gnome.org"
license=(BSD MIT OFL custom)
makedepends=(git python-sphinx python-sphinx-furo python-sphinx-tabs)
optdepends=('apache: Web server' 'nginx: Web server')
install=$pkgname.install
source=("$pkgname"::"git+https://gitlab.gnome.org/Teams/documentation/developer-www.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  ./build.sh --incremental
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir"/srv/http "$pkgdir"/usr/share/licenses
  rm -rf $(find build -name .doctrees)
  cp -rT build "$pkgdir"/srv/http/gnome-developer-www
  cp -rT LICENSES "$pkgdir"/usr/share/licenses/gnome-developer-www
}
