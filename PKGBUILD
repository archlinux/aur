# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.2.14'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='easy-llama'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Python package wrapping llama.cpp for on-device LLM inference"

arch=('any')
url='https://github.com/hirsimaki-markus/easy-llama'
_gurl="https://github.com/ddh0/easy-llama"
license=('MIT')

depends=('python' 'python-pydantic' 'python-fastapi' 'python-tqdm' 'uvicorn' 'python-jinja' 'python-numpy')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "README-${pkgver}.md::${_gurl}/readme.md"
        "LICENSE-${pkgver}::${_gurl}/unlicense")
sha256sums=('e159f5dd82882237fa96c8260a594486cb9387191fc13d36c70f435fe352a09e'
            '15f82faec0f768ff39c929ed698b03ee7fec2c796b4101442347294c259c03a5'
            '6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
