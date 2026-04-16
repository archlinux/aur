# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tomasvotava
_pkgname=fastapi-sso
pkgname=python-${_pkgname}
pkgver=0.21.0
pkgrel=1
pkgdesc="FastAPI plugin to enable SSO to most common providers (latest tagged version)"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')

makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
depends=('python' 'python-fastapi' 'python-httpx' 'python-oauthlib' 'python-pydantic' 'python-pyjwt' 'python-typing_extensions' 'python-starlette')

conflicts=("${pkgname}-git")

source=("git+${url}.git#tag=${pkgver}")
sha256sums=('6849853b5626a08b388c76adb04bcf231f02de11a612a1a13a3466cc6248d97a')


build() {
    cd "$_pkgname"

    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license if available
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
