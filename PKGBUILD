# Maintainer: Thomas Lam <thomas@lamcw.com>

pkgname=python-pyls-isort-git
_pkgname=pyls-isort
pkgver=0.1.1.r2.g5654f98
pkgrel=1
pkgdesc="Isort plugin for python-language-server"
arch=('any')
url="https://github.com/paradoxxxzero/pyls-isort"
license=('MIT')
depends=('python' 'python-language-server' 'python-isort')
makedepends=('git' 'python-setuptools')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname}"
	python setup.py build
}

package() {
	cd "$srcdir/${_pkgname}"
	python setup.py install --root=$pkgdir --optimize=1
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
