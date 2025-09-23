# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='1.5.55'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='scalene'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A high-resolution, low-overhead CPU, GPU, and memory profiler for Python with AI-powered optimization suggestions"
arch=('any')
url='https://github.com/plasma-umass/scalene'
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'python' 'ipython' 'python-cloudpickle' 'python-jinja' 'python-pydantic' 'python-cysignals' 'python-rich' 'python-boto3' 'python-astunparse' 'python-nvidia-ml-py')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('71c0c89287f46f9f1fa965def5866156313a949ed592b8acb008f8cafcf7c518')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
