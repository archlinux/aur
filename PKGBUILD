# Maintainer: Sergey Malkin <adresatt@gmail.com>
pkgname=python-neo-git
_pkgname=python-neo
pkgver=0.5.2.r205.gc66dbfe
pkgrel=1
pkgdesc="Neo is a Python package for working with electrophysiology data in Python"
arch=("i686" "x86_64")
url="http://neuralensemble.org/neo"
license=("custom")
depends=("python" "python-numpy" "python-quantities")
provides=("python-neo")
conflicts=("python-neo")
makedepends=('python-setuptools')
source=($_pkgname'::git+https://github.com/NeuralEnsemble/python-neo.git')
md5sums=("SKIP")
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  python setup.py install --prefix=/usr --root=${pkgdir}
}
