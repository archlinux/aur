# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.1.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='otranscribe'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Transcribe any audio or video via OpenAI STT. Supports diarisation and cleaned rendering."

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/otranscribe/'
_url_github='https://github.com/ineslino/otranscribe'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
optdepends=('python-openai-whisper: local engine')
depends=('python' 'python-requests')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('4435c46b8a53f35db66604baa990bc0e9fa06dc6d13577f9a3fac994d9c73c10')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "docs/USAGE.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "docs/TROUBLESHOOTING.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
