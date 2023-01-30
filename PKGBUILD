# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-python-compreffor-git
pkgver=0.5.3.r0.g3678d3e
pkgrel=1
pkgdesc='A CFF table subroutinizer for FontTools'
url='https://github.com/googlefonts/compreffor'
license=('Apache-2.0')
arch=(any)
depends=(python
         python-fonttools)
checkdepends=(python-pytest)
makedepends=(cython
              python-setuptools-git-ls-files
              python-setuptools-scm
              python-wheel
              git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build_ext --inplace
	python setup.py build
}

check() {
    cd "$pkgname/src/python"
    PYTHONPATH=. pytest compreffor/test
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

