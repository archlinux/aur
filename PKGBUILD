# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-keras-flops
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc="FLOPs calculator for TF2+"
arch=('any')
url="https://github.com/tokusumi/keras-flops"
license=('MIT')
depends=('python-tensorflow')
makedepends=('python-setuptools' 'python-dephell')
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2561043d435dce3b0b6a68573a538facddbcfa637faf7ae7f48b2e8f373ed84e')

prepare() {
	cd "$srcdir/${_name}-${pkgver}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "$srcdir/${_name}-${pkgver}"
    python setup.py build
}

package() {
	cd "$srcdir/${_name}-${pkgver}"
    PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-keras-flops/LICENSE"
}
