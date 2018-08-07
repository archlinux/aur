# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
pkgname=python-globus-cli
_pkgname=globus-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="A command line interface to Globus"
arch=(any)
url="https://globus.github.io/globus-cli"
license=('Apache')
depends=(
    'python'
    'python-globus-sdk=1.5.0'
    'python-click'
    'python-jmespath'
    'python-configobj'
    'python-requests'
    'python-six'
    'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ea47eb4bce1b552f72fafbd4e452de12114f7083db725bb3fffae32db679d6f9')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # HACK: use new version of jmespatch
    sed -i 's/jmespath==0.9.2/jmespath==0.9.3/g' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

