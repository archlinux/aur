# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.10.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='user-scanner'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Check username availability across multiple popular platforms"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/user-scanner/'
_url_github='https://github.com/kaifcodec/user-scanner'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

depends=('python' 'python-colorama' 'python-httpx')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('30177e39be04d107d49f1cc4dd3c3896601cdacf28870a164add89d5eaeff0b2')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
