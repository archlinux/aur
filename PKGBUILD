# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia
_pkgname=skia-python
pkgver=87.0
pkgrel=1
pkgdesc='Python binding to Skia Graphics Library'
arch=('x86_64')
url="https://github.com/kyamagu/$_pkgname"
license=('BSD')
depends=('fontconfig' 'opengl-driver' 'python')
makedepends=('pybind11' 'python-pip' 'python-setuptools')
options=(!strip)
_py=cp38
_wheel=${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('4abd27e394baf864868ed8c8d16c2cd483f95489efb58791c08c06a9ac042940')

package() {
    export PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "$pkgdir"
}
