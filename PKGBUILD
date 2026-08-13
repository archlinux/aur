# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname='ytfetcher'
pkgname="python-${_pkgname}"
pkgver=2.4
pkgrel=1
pkgdesc="Effortlessly fetch thousands of YouTube video transcripts and metadata in bulk"

_pypi_package=${_pkgname}
_pypi_version=${pkgver}

arch=('any')
url='https://pypi.org/project/ytfetcher/'
license=('MIT')
depends=('yt-dlp' 'python' 'python-youtube-transcript-api' 'python-fake-useragent' 'python-tqdm' 'python-pydantic' 'python-requests' 'python-dotenv' 'python-httpx')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('1956b6f3f5aa2d418ae405214314b06436da956a3946f3be02cf74ff68fb1eef')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
