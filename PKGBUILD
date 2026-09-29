# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Daniel Chesters <archlinux@coin-coin.xyz>

pkgname="python-ollama"
pkgdesc="Ollama Python library"
pkgver=0.6.2
pkgrel=1

arch=('any')
license=('MIT')
url='https://github.com/ollama/ollama-python'

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

depends=('ollama' 'python' 'python-httpx' 'python-typing_extensions' 'python-pydantic' 'python-anyio')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatch-vcs')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('936d55daa684f474364c098611c933626f8d6c7d67065c5b7ae0c477b508b07f')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
}
