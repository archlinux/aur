# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: SZanko szanko at protonmail dot com

_upstreamver='0.16.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='python-fsutil'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="High-level file-system operations for lazy devs"
arch=('any')
url='https://github.com/fabiocaccamo/python-fsutil'
license=('MIT')

depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('78f8145ade0baa0c915d4ac4868b8c22b9f0707d4d5418a487d339953712e1bd')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "SECURITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
