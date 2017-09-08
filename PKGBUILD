# Maintainer: icasdri <icasdri at gmail dot com>
# Maintainer: hexchain <i@hexchain.org>

_pypi_name=mypy
pkgname=${_pypi_name}
pkgver=0.521
pkgrel=3
pkgdesc='Optional static typing for Python 2 and 3'
url="https://github.com/python/mypy"
arch=('any')
license=('MIT')
provides=('python-mypy-lang' 'python-mypy')
conflicts=('python-mypy-lang' 'python-mypy')
depends=('python-typed-ast')
source=(
    "$_pypi_name-$pkgver.tar.gz::https://pypi.org/packages/source/m/$_pypi_name/$_pypi_name-$pkgver.tar.gz"
    "$pkgname.LICENSE::$url/raw/v$pkgver/LICENSE")

package() {
    cd "$srcdir"
    install -Dm644 "$pkgname.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "${srcdir}/${_pypi_name}-${pkgver}"
    sed -i "s/'typed-ast >= 1.0.4, < 1.1.0'/'typed-ast >= 1.0.4, < 1.2.0'/" setup.py
    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
}
sha256sums=('9d30df20cd937b80cfc6007d75426f27a232789cfa288c63bf9370f2542c9658'
            'b2f0953f966a13bc1b01f4225420fd106ef870a39c8f8ff8b22aaf4cc77c0cfe')
