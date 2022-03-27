# Maintainer: zan <zan@nie.rs>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kapidox
pkgname=$_pkgname-git
pkgver=r566.d385445
pkgrel=1
pkgdesc='Frameworks API Documentation Tools'
arch=('any')
url='https://community.kde.org/Frameworks'
license=('LGPL')
depends=(python-jinja python-yaml)
makedepends=(python-build python-installer python-wheel git qt5-base)
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
  cd $srcdir/$_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
