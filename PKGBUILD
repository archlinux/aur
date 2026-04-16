# Maintainer: taotieren <admin@taotieren.com>

_pkgauthor=tomasvotava
pkgname=python-fastapi-sso
_pkgname=${pkgname#python-}
pkgver=0.21.0
pkgrel=2
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
sha256sums=('6849853b5626a08b388c76adb04bcf231f02de11a612a1a13a3466cc6248d97a')

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
