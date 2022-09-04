# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=python-gifsicle
pkgver=1.0.6
pkgrel=1
pkgdesc='Python package wrapping the gifsicle library for editing and optimizing gifs'
arch=('any')
url='https://pypi.org/project/pygifsicle/'
license=('GPL2')
depends=('python' 'gifsicle')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('https://files.pythonhosted.org/packages/60/ac/901e0959ca6c72c58c4cb9a783afd0ac8abc0f125032fbfb5b30185f71ff/pygifsicle-1.0.6.tar.gz')
sha256sums=('4853aea9faa7b2e749fcd9a05a5abb8450cbe25d6c3b8f0141e91669b51ee92d')

prepare() {
    cd pygifsicle-${pkgver}

    sed -i 's|elif platform.system() == "Linux"|elif platform.system() == "FFS"|g' setup.py
}

build() {
    cd pygifsicle-${pkgver}

    python -m build --wheel --no-isolation
}

package() {
    cd pygifsicle-${pkgver}

    python -m installer --destdir="${pkgdir}" dist/*.whl
}
