# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.0.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='git-user-manager'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
_pkgexec=${pkgname}
pkgrel=1
pkgdesc="A tool to manage git users from the terminal"

license=('LGPL-2.1')
arch=('any')

_url_pypi='https://pypi.org/project/git-user-manager/'
_url_github='https://github.com/ankushbhagats/git-user-manager'
url="${_url_github}"

provides=("${_pkgexec}")
conflicts=("python-${pkgname}")

depends=('bash' 'git' 'python-inquirerpy')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('a9d6a57a293c64ab3de1fee1cdde29b03b35f91981b749e68ca55c0201caa125')

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
