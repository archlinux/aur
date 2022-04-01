# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=ppmd-cffi
pkgname=python-ppmd-cffi
pkgver=0.5.0
pkgrel=2
pkgdesc="PPMd compression/decompression library"
arch=('x86_64')
url="https://github.com/miurahr/ppmd"
license=('LGPL')
depends=('python-cffi')
makedepends=('python-setuptools-scm')
checkdepends=('python-hypothesis' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2fa0a65813885e3243aa8d750c1ae08cc4834fbfce2a5341c7d44d9704bdf96e')
b2sums=('063a7a2e69a790d750ecc0efed77ae14d5203e06c74bd42b487e8901f147410964948846a258f2f2cff6864d8ecdb2f95758cfaf36af1662fbebb11cac681eaf')

build(){
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

check() {
    cd ${_pkgname}-${pkgver}

    pythonpaths=("$PWD/build/lib.linux-$CARCH"-3*)
    PYTHONPATH="${pythonpaths[0]}" pytest -rsx -k 'not test_cli_help'
}

package() {
    cd ${_pkgname}-${pkgver}

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
