# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='0.0.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='askora'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A unified CLI for AI providers like OpenAI and Ollama"
arch=('any')
url='https://github.com/rosettadb/askora'
license=('MIT')
depends=('python' 'python-typer' 'python-httpx' 'python-pydantic' 'python-openai' 'python-anthropic')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('aa34501fd415b5a92a7d2efd99f1103061d7e98bb468bb76cb65eaf59d06d156'
            '339b24708f2e7b822ebce7271d7e7172cb522114c2aee5559015b2fbb3106082')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
