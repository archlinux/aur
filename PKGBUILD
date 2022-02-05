# Maintainer: endlesseden
_pkgname=python-mot
pkgname=$_pkgname-git
pkgver=1.0.1.r3.gd72a533
pkgrel=1
pkgdesc="Python API for DAB MOT applications"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/opendigitalradio/python-dabmot"
license=('GPL')
groups=()
depends=('python')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "$(git describe --tags | sed 's|-|.|g' | sed 's/v//g').r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
