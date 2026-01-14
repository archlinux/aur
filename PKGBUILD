# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='4.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='seapie'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A breakpoint should just mean >>>"

arch=('any')
url='https://github.com/hirsimaki-markus/seapie'
license=('Unlicense')

depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${_pypi_package}-${_upstreamver}.tgz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f8f395833dd3ee1c4be9d525432a429295a3583f57136b9b0cdf1a6d7d1ec425')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "unlicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
