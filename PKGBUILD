# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=python-gifsicle
pkgver=1.0.7
pkgrel=1
pkgdesc='Python package wrapping the gifsicle library for editing and optimizing gifs'
arch=('any')
url='https://pypi.org/project/pygifsicle/'
license=('MIT')
depends=('python' 'gifsicle')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('https://files.pythonhosted.org/packages/b2/78/e6631e5f19fda153767e94dc3081fe4c9808f060105a3a74c07d47a64f13/pygifsicle-1.0.7.tar.gz')
sha256sums=('506ae0e4c76992a4fd6097da2d3f224a869ad504879fb1191d6af96c3d394ef8')

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
