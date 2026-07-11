# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Shane Donohoe <shane@donohoe.cc>

_upstreamver='1.9.0.67.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='iterfzf'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Pythonic interface to fzf"
arch=('any')
url="https://github.com/dahlia/iterfzf"
license=('GPL-3.0')
depends=('python' 'fzf')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-flit-core')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('9e9ddeba324a6bf7786f6033d1ed5030c2b36bce86ef63f9e76ecb84529e45ac')


prepare() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    sed -i -e 's|requires = \[.*\]|requires = \[\"flit_core\"]|g' "./pyproject.toml"
}

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
