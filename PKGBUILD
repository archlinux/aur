# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=python-fasttext-git
pkgdesc="Library for fast text representation and classification – Python bindings"
url="https://github.com/facebookresearch/fastText"

provides=("python-fasttext")
conflicts=("python-fasttext")

pkgver=v0.9.2.r9.g0622aad
pkgrel=2

arch=("any")
license=("BSD")

makedepends=("python-setuptools" "git")
depends=("pybind11" "python-future" "python-numpy" "python-scipy" "python-pytorch")

source=(
    "${pkgname}::git+https://github.com/facebookresearch/fastText.git"
    "${pkgname}-cstdint.patch"
)
    
b2sums=(
    "SKIP"
    "5d7c95b54ceb1998b4fd62ce11b6ac94f5c5f95f46488b8da79b04e2b7275bde6af105b120ef61ce81d16418a822b105cc84007f2398e6eb1982b916ff689281"
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
  cd "${srcdir}/${pkgname}"
    patch --forward --strip=1 --input "${srcdir}/${pkgname}-cstdint.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root=${pkgdir} --optimize=1
}
