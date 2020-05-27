# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kapidox
pkgname=$_pkgname-git
pkgver=r474.525886b
pkgrel=1
pkgdesc='Frameworks API Documentation Tools'
arch=('any')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=(python-jinja python-yaml)
makedepends=(cmake git qt5-base)
groups=('kf5')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+https://github.com/KDE/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  mkdir -p build
}

build() {
  cd $srcdir/$_pkgname/build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
