# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="volotat"
pkgname="tuimg"
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal image viewer, that utilizes a pretrained image tokenizer's codebook as a custom 4096-glyph font for text-only image approximation"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('bash' 'python' 'python-huggingface-hub' 'python-scikit-learn' 'python-pillow' 'python-numpy' 'python-pytorch' 'python-scipy' 'python-fonttools')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31a11dd254f7646a7b9c3728937c891a9c0f9dbb02b406340c57c3a95dcc4cbc')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
