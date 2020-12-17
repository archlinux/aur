# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia
_pkgname=skia-python
pkgver=87.0
pkgrel=2
pkgdesc='Python binding to Skia Graphics Library'
arch=('x86_64')
url="https://github.com/kyamagu/$_pkgname"
license=('BSD')
depends=('fontconfig' 'opengl-driver' 'python')
makedepends=('pybind11' 'python-pip' 'python-setuptools')
options=(!strip)
_py=cp39
_wheel=${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('2042c813038dc9ad64180531f0c06bb2133ab14fdb9fc951a04d8a41b7ed9ba0')

package() {
    export PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "$pkgdir"
}
