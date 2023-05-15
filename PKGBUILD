# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>

_name='pycma'
pkgname="python-${_name}-git"
pkgver=r796.6080396
pkgrel=1
pkgdesc="Python implementation of CMA-ES"
provides=(python-${_name})
url="https://github.com/CMA-ES/${_name}"
depends=('python-numpy')
makedepends=('python-setuptools')
license=('MIT')
arch=('x86_64')

pkgver() {
  cd "${srcdir}/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("git+${url}.git")
	
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${_name}"
	sed -i '/^__version__ =/ s/modified//' "cma/__init__.py"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


