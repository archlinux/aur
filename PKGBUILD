# Maintainer: taotieren <admin@taotieren.com>

_pkgauthor=tomasvotava
pkgname=python-fastapi-sso
_pkgname=${pkgname#python-}
pkgver=0.21.1
pkgrel=1
pkgdesc="FastAPI plugin to enable SSO to most common providers"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
depends=(
    'python'
    'python-httpx'
    'python-oauthlib'
    'python-pydantic'
    'python-pyjwt' 
    'python-starlette'
)
makedepends=(
    'git' 
    'python-build' 
    'python-installer' 
    'python-wheel' 
    'python-poetry-core'
)
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('de0b418651ee3b85717625cdb42a43ab5b7c1b07e70e2ca7d4b5b355bb8e2e3b')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license if available
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
