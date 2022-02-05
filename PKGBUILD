# Maintainer: endlesseden
_pkgname=python-mot-epg
pkgname=$_pkgname-git
pkgver=1.0.3.r9.g4b84f1f
pkgrel=1
pkgdesc="Plugin to the python-mot library to handle DAB EPG binary encoding"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/opendigitalradio/$_pkgname"
license=('GPL')
groups=()
depends=('python' 'python-mot')
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
