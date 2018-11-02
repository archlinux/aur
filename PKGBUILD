# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=usrsvc
pkgver=1.5.13
pkgrel=1
pkgdesc="A service manager for running/managing/monitoring/auto-restarting daemons and services at the user (non-root) level"
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/usrsvc"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-configobj' 'python-namedatomiclock' 'python-func_timeout' 'python-subprocess2')
source=("https://github.com/kata198/usrsvc/archive/${pkgver}.tar.gz")
sha512sums=("f08598f10d7db775dc725f3f70d2eb768085cfa79ebfd0ab1d2649b92a4b2867a8d7cde8e7349ad998101804a45aaf8d9a04f03d40ee91faedb7d685db24d05b")
install="install.sh"

build() {
  cd "$srcdir"/usrsvc-$pkgver
  python setup.py build
}

package() {
  cd usrsvc-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cd systemd
  ./install.sh DESTDIR="${pkgdir}"
}
