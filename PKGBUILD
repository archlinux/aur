# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
pkgname=python-globus-cli
_pkgname=globus-cli
pkgver=0.6.0
_pkgver=0.6.0.0
pkgrel=1
pkgdesc="A command line interface to Globus"
arch=(any)
url="https://globus.github.io/globus-cli"
license=('Apache')
depends=('python' "python-globus-sdk=$pkgver" 'python-configobj' 'python-click')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('82a2c8fc0666fce45e70a67938fde5635c7fe4d09812c6b7927ee7d80f1eb531')

prepare() {
    cd "$srcdir/$_pkgname-$_pkgver"
    # don't include tests packages
    sed -sie 's/find_packages()/find_packages(exclude=["tests.*", "tests"])/' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$_pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

