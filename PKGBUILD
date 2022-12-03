# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>
_pkgname=gnome-developer-www
pkgname=gnome-developer-www-git
pkgver=r350.ea0ea9d
pkgrel=1
pkgdesc="GNOME development website"
arch=(any)
url="https://developer.gnome.org"
license=(BSD MIT OFL custom)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git python-sphinx python-sphinx-furo python-sphinx-tabs)
optdepends=('apache: Web server' 'nginx: Web server')
install=$pkgname.install
source=("$_pkgname"::"git+https://gitlab.gnome.org/Teams/documentation/developer-www.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  ./build.sh --incremental
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir"/srv/http "$pkgdir"/usr/share/licenses
  rm -rf $(find build -name .doctrees)
  cp -rT build "$pkgdir"/srv/http/gnome-developer-www
  cp -rT LICENSES "$pkgdir"/usr/share/licenses/"$_pkgname"
}
