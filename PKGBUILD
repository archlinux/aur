# Maintainer: Leon Richardt <aur at leon.dev>
pkgname=python-ipfn
pkgver=1.4.4
pkgrel=1
pkgdesc="Iterative Proportional Fitting with N dimensions"
url="https://pypi.org/project/ipfn/"
license=("MIT")
arch=("any")

depends=('python' 'python-pandas' 'python-numpy')
makedepends=('python-setuptools' 'python-pytest')
provides=('python-ipfn')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bf6b446f9dea53e28481a5cff9461769cba5711542eaebe05e554ac09c832ddd')

build() {
    cd "${srcdir}/$_name-${pkgver}"
    python -m build
}

package() {
    cd "${srcdir}/$_name-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 licence.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check(){
    cd "$srcdir/$_name-$pkgver"

    pytest --verbose tests/tests.py
}
