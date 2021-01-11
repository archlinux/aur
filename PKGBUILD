# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-skia
_pkgname=skia-python
pkgver=87.1
pkgrel=1
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
sha256sums=('d5f32f9205dc59b7862440c1a6e77f39a5839539a7c156803e693e82ece32159')

package() {
    export PIP_CONFIG_FILE=/dev/null
    pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $_wheel
    python -O -m compileall "$pkgdir"
}
