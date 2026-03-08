# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='ytfetcher'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Effortlessly fetch thousands of YouTube video transcripts and metadata in bulk"
arch=('any')
url='https://pypi.org/project/ytfetcher/'
license=('MIT')
depends=('yt-dlp' 'python' 'python-youtube-transcript-api' 'python-fake-useragent' 'python-tqdm' 'python-pydantic' 'python-requests' 'python-dotenv' 'python-httpx')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('d23af98c4437ce6aec708ca0396e6b76b2eb81f3379bafbe5932a0124f6210ed')


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
