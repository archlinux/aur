# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=bcj-cffi
pkgname=python-bcj-cffi
pkgver=0.5.1
pkgrel=3
pkgdesc="BCJ(Branch-Call-Jump) filter for python"
arch=('x86_64')
url="https://github.com/miurahr/${_pkgname}"
license=('LGPL')
depends=('python-cffi')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2b4a5d1252e72bea5a5eb1e51650435825299b0e87c25ddfd21a1623514fd0cc')
b2sums=('f31161555597c477b052ad42ac42642b97788c3eb6a22cc48872429456a8665c9b810910a2a1f84c99a40135c17f7bbe0829115643f7d495d2d52cfc6c7a50b5')

prepare() {
    cd ${_pkgname}-${pkgver}

    # thou shalt not force coverage reports on innocent unittest users
    sed -i '/^addopts/d' tox.ini
}

build(){
    cd ${_pkgname}-${pkgver}

    python setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}

    pythonpaths=("$PWD/build/lib.linux-$CARCH"-3*)
    PYTHONPATH="${pythonpaths[0]}" pytest -rsx
}

package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
