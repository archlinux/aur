# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=python-pyvcf3
_name=PyVCF3
pkgver=1.0.4
pkgrel=1
pkgdesc="Variant Call Format (VCF) parser for Python3"
arch=('x86_64')
url=https://github.com/dridk/PyVCF3
license=('BSD-3-Clause')
depends=('python' 'cython' 'glibc' 'python-pysam' 'python-setuptools')
makedepends=('python-setuptools' 'python-pytest' 'git')
#'python-pytest-runner'
source=(${_name}-${pkgver}::git+https://github.com/dridk/PyVCF3.git#tag=1.0.4)
sha256sums=('4ecbf4a554dc75828f00bb6a7b4f0f96d22805fd84b39666dca071265c61aedf')
provides=('python-pyvcf')
conflicts=('python-pyvcf')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
    #python setup.py pytest

}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
