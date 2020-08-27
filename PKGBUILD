# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=python-globus-cli
_pkgname=globus-cli
pkgver=1.13.0
pkgrel=1
pkgdesc="A command line interface to Globus"
arch=(any)
url="https://globus.github.io/globus-cli"
license=('Apache')
depends=(
    'python-globus-sdk'
    'python-click'
    'python-jmespath'
    'python-configobj'
    'python-requests'
    'python-six'
    'python-cryptography')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e319050c0289b11bb77d6e852486187314449df6b3084b8ce2aba0b9ae062153')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    # HACK: use new version of jmespatch
    sed -i 's/jmespath==0.9.4/jmespath>=0.9.4/g' setup.py
    # HACK: use new version of globus-sdk
    sed -i 's/globus-sdk==1.9.0/globus-sdk>=1.9.0/g' setup.py
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

