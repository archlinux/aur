# Maintainer: igo95862 <address at domain dot tld>
pkgname=bubblejail-git
pkgver=r114.b7ea75c
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'python-setuptools' 'rsync')
makedepends=('git')
source=("$pkgname"::"git+https://github.com/igo95862/bubblejail")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check () {
	cd "$srcdir/$pkgname"
	python -m unittest
}

build () {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir"
}
