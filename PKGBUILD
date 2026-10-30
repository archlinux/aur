# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=semantic-diff
pkgver=0.7.0
pkgrel=1
pkgdesc="AI-powered semantic analysis of git commits. Goes beyond git diff to show intent, impact, risk, and review questions."

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/semantic_diff/'
_url_github='https://github.com/tkenaz/semantic_diff'
url="${_url_github}"

provides=("${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-rich' 'python-dotenv' 'python-click' 'python-anthropic' 'python-gitpython' 'python-pydantic')

source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9603b50e2e88e744b8898630c828b389031ef0a9ca13cf6893b925a5c7f33a8c')

build() {
    cd "${srcdir}/${pkgname//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
