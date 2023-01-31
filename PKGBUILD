# Maintainer: bipin kumar <bipin@ccmb.res.in>

pkgname=python-pyvcf3
_name=PyVCF3
pkgver=1.0.3
pkgrel=1
pkgdesc="Variant Call Format (VCF) parser for Python3"
arch=('x86_64')
url=https://github.com/dridk/PyVCF3
license=('custom')
depends=('python' 'cython' 'python-pysam' 'python-setuptools')
makedepends=('python-setuptools' 'python-pytest-runner')
source=("${_name}-${pkgver}.tar.gz"::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b16d71c8b97010487e2c939fb4d5707b7bbfa4e2b313df9dba3e372c5ba031d')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

check() {
    cd "$_name-$pkgver"
    python setup.py pytest
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
