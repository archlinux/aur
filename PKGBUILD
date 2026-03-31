# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.30'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='ffmpegp'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="An enhanced version of FFmpeg, offering additional features and functionalities to extend its powerful media processing capabilities"

license=('LGPL-2.1')
arch=('any')

_url_pypi='https://pypi.org/project/ffmpegp/'
_url_github='https://github.com/ankushbhagats/ffmpegp'
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

depends=('bash' 'ffmpeg' 'python' 'python-jsonpath-ng' 'python-pyargument')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('172fe4b68844b16210c0075a28baf769247f7ea9883285aeb6d060dec1f65401')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
