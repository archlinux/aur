# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-fasttext-predict-git
pkgdesc="fasttext with wheels and no external dependency, but only the predict method (<1MB)"
url="https://github.com/searxng/fasttext-predict"
provides=("python-fasttext-predict")
conflicts=("python-fasttext" "python-fasttest-git" "python-fasttext-predict")
pkgver=0.9.2.1.r0.g0807442
pkgrel=2
arch=("x86_64")
license=("MIT")
makedepends=("git" "python-setuptools")
depends=("pybind11")
source=("${pkgname}::git+$url.git")
b2sums=("SKIP")

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname"
  python setup.py install --root=${pkgdir} --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/python-fasttext-predict/LICENSE"
}
