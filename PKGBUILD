# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='0.0.3'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='tasklin'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A single CLI to connect with OpenAI, Ollama, and more AI platforms"
arch=('any')
url='https://github.com/jetroni/tasklin'
license=('MIT')
depends=('python' 'python-typer' 'python-httpx' 'python-pydantic' 'python-openai' 'python-anthropic')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('6b005ace3b2d6881e419f452d2bffe7738eba14d66ad35a59d5088e05f4591e2')


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
