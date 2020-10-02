# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia
_pkgname=skia-python
pkgver=86.0
pkgrel=1
pkgdesc='Python binding to Skia Graphics Library'
arch=('x86_64')
url="https://github.com/kyamagu/$_pkgname"
license=('BSD')
depends=('fontconfig' 'opengl-driver' 'python')
makedepends=('pybind11' 'python-pip' 'python-setuptools')
_py=cp38
_wheel=${_pkgname/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/$_wheel")
sha256sums=('e9c402276242d48772c3edb77076d135e27f4f3fd4e078c7d8bdc29704338c4d')

package() {
    export PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "$pkgdir"
}
