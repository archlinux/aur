# Maintainer: Felipe Bartelt <fbartelt at ufmg dot br>
pkgname='python-quadprog'
_name=${pkgname#python-}
# _py=cp313
pkgver=0.1.13
pkgrel=1
pkgdesc="Solve a strictly convex quadratic program"
arch=('x86_64')
url="https://github.com/quadprog/quadprog"
license=('GPL-2.0-or-later')
depends=('python>=3.9' python-numpy glibc)
makedepends=(python-build python-installer python-wheel python-setuptools cython)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9d6dd32f2762f29b840fb83741d11e527ddf48745f63b79caad0e530b4a6a0ff')
options=('!debug')
# source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-${_py}-manylinux_2_17_x86_64.manylinux2014_x86_64.whl")
# sha256sums=('cc1996a0e3de1d423f8662fe21368948afdc91d851910b77320caaf7c15357ff')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
#build() {
#    cd $_name
#    python -m build --wheel --no-isolation
#}

# package() {
#     #cd $_name-$pkgver
#     python -m installer --destdir="$pkgdir" *.whl
#     install -Dm644 "${_name}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
# }
