# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=usrsvc
pkgver=1.5.12
pkgrel=2
pkgdesc="A service manager for running/managing/monitoring/auto-restarting daemons and services at the user (non-root) level"
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/usrsvc"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python' 'python-configobj' 'python-namedatomiclock' 'python-func_timeout' 'python-subprocess2')
source=("https://github.com/kata198/usrsvc/archive/${pkgver}.tar.gz")
sha512sums=('f674bdbc27c065cbefcd39debca33e30a403f5b9ee67850247ca2781f58fcbf7d4fc3f0eb6c7e1b0462346c8176bb8cc46c38400ad6e0125c2b87b9955048b33')
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
