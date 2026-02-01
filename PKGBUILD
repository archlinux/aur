# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pypi_package='fdir-cli'

pkgname="${_pypi_package%%-cli}"
pkgver=3.3.1
pkgrel=1
pkgdesc="The search language for your filesystem"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/fdir-cli/'
_url_github='https://github.com/VG-dev1/fdir'
url="${_url_github}"

provides=("${pkgname}")
conflicts=("${_pypi_package}")

depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fc0f78ee9206fb4d42dcc3cead83023cefa5445879eb3829d577d036f968670')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
