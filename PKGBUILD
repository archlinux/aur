# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.25'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='terminal-widgets'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
_pkgexec=twidgets
pkgrel=1
pkgdesc="A fully functional program for Terminal to show information about system, display, shell, package and many more"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/terminal-widgets/'
_url_github='https://github.com/ankushbhagats/terminal-widgets'
url="${_url_github}"

provides=("${_pkgexec}")
conflicts=("python-${pkgname}")

depends=('bash' 'python' 'python-requests' 'python-py-cpuinfo' 'python-psutil' 'python-rich' 'python-rich-argparse')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('9cb91c1541c3f79bad09d199e192ec240869e1368043004991749b6658fa5314')

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
