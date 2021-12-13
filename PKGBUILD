# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-fasttext-git
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=("python-fasttext")
conflicts=("python-fasttext")

pkgver=v0.1.0.r85.g25c3994
pkgrel=3

arch=("any")
license=("BSD")

makedepends=("python-setuptools" "python2-setuptools")
depends=("pybind11" "python-future" "python-numpy" "python-scipy" "python-pytorch")

source=("${pkgname}::git+https://github.com/facebookresearch/fastText.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}"/python-fasttext-git
  python setup.py build
}

package() {
  cd "${srcdir}/python-fasttext-git"
  python setup.py install --root=${pkgdir} --optimize=1
}
