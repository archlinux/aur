# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="maxludden"
_appname="rich-gradient"

pkgname="python-${_appname}"
pkgver=0.3.13
pkgrel=1
pkgdesc="This is a python library built on textualize/rich that allows the printing of gradient colored text to the console"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build' 'python-hatchling')
depends=('python' 'python-rich' 'python-pygments' 'python-loguru' 'python-rich-color-ext')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz" "LICENSE")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz" "LICENSE")
sha256sums=('d8cbbc344c8f4dd006dc25b5bfca8b9a36cac02f79d36105a4f934a36f0d525e'
            'ce03c1e0e64ef777f23081460c6474be87d9298b649dca8a01059c51ad9e1b30')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
