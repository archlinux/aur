# Maintainer: Kherim Willems (aka willemsk) aur [at] kher [dot] im

pkgname=python-pymeasure
_name=PyMeasure
pkgver=0.14.0
pkgrel=2
pkgdesc="Scientific measurement library for instruments, experiments, and live-plotting"
arch=(any)
url="http://pypi.python.org/pypi/${_name}"
license=('MIT')
depends=('python>=3.8' 'python-numpy>=1.6.1' 'python-pandas>=0.14' 'python-pint' 'python-pyvisa>=1.9'
         'python-pyserial>=2.7' 'python-pyqtgraph>=0.12' 'python-importlib-metadata')
makedepends=('python-setuptools>=45' 'python-wheel' "python-setuptools-scm>=6.2")
# checkdepends=('python-pytest>=3.3.0' 'python-pytest-cov>=4.1.0' 'python-pytest-qt>=2.4.0' 'python-pyvisa-sim>=0.4.0')
optdepends=('python-pyzmq>=16.0.2: tcp support'
            'python-cloudpickle>=0.3.1: tcp support'
            'python-vxi11>=0.9: VXI-11 ethernet support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${pkgname#python-}-${pkgver}.tar.gz")
sha256sums=('bbe91bbe3241992a616f165c30d150f01cc900309a7926f605690aa845911742')
options=(!emptydirs)

build() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${srcdir}/${pkgname#python-}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-pymeasure/
}
