# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-scalene"
pkgver=2.4.0
pkgrel=1
pkgdesc="A high-resolution, low-overhead CPU, GPU, and memory profiler for Python with AI-powered optimization suggestions"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
license=('BSD-2-Clause')
url='https://github.com/plasma-umass/scalene'

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('glibc' 'libgcc' 'python' 'ipython' 'python-yaml' 'python-cloudpickle' 'python-jinja' 'python-pydantic' 'python-cysignals' 'python-rich' 'python-boto3' 'python-astunparse' 'python-nvidia-ml-py')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('bdf2a7b6cf3489e5c3fb77c76dd5627a9c595bc1e198a2bf28d4890481b3d8a6')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
