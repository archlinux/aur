# Maintainer: Alessio <alessio at linux dot com>

pkgbase=python-neosctl
_pyname=neosctl
pkgname=("${pkgbase}")
pkgver=0.9.1
pkgrel=2
pkgdesc="Neosctl for management of neos services via CLI "
arch=('any')
url="https://pypi.org/project/neosctl/"
license=('custom')
depends=('python-poetry-core' 'python-typer' 'python-pytest-httpx' 'python-pygments')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-poetry' 'python-poetry-core' 'python-minio')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=(65e19e22546281317163af643e6e25bad30dee942ca54c1e832b79ed910e0cac)

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation
}

package_python-neosctl() {

    provides=('python-neosctl')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
