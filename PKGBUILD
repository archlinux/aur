# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=python-gifsicle
pkgver=1.0.5
pkgrel=1
pkgdesc='Python package wrapping the gifsicle library for editing and optimizing gifs'
arch=('any')
url='https://pypi.org/project/pygifsicle/'
license=('MIT')
depends=('python' 'gifsicle')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=('https://files.pythonhosted.org/packages/21/78/c1f6a45c338352915e7da9ca5e6bf519d687272f7bff694a70768d3db00b/pygifsicle-1.0.5.tar.gz')
sha256sums=('be7fef569c5a52c03493ab6cdb3a661634e0863127abdd5c57cbd29150fb5dfc')

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
