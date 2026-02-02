# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=semantic-diff
pkgver=0.2.0
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
sha256sums=('bc8e2b410526f464ae70d8541b9d48f35f1fd71ef6ebb543152d774b2cf6cd1f')

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
