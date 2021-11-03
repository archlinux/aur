# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_name=premailer
pkgname=python-$_name
pkgver=3.10.0
pkgrel=1
pkgdesc="Turns CSS blocks into style attributes"
url="https://premailer.io/"
depends=(
    'python-lxml'
    'python-cssselect'
    'python-cssutils'
    'python-requests'
    'python-cachetools'
)
makedepends=('python-setuptools')
provides=("python-$_name")
conflicts=("python-$_name")
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d1875a8411f5dc92b53ef9f193db6c0f879dc378d618e0ad292723e388bfe4c2')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # Install license
    _licensedir=$pkgdir/usr/share/licenses/$pkgname/
    install -d $_licensedir
    install -m644 LICENSE $_licensedir
}
