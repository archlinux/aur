# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: LightDot <lightdot -a-t- server.si>

pkgname=python-slowapi
pkgver=0.1.10
pkgrel=1
pkgdesc="A rate limiting extension for Starlette and Fastapi"
url="https://github.com/laurents/slowapi"
depends=(python python-limits)
makedepends=(git python-build python-installer python-wheel python-poetry-core)
license=(MIT)
arch=(any)
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('da8062c2d16f653e1c9ed422333bfe2a1603a52f8923ec4083b6722b07776a49')
validpgpkeys=(3F2FEB2945E72B8A60EA15D81E7737FF61F9B5AC)

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/slowapi-$pkgver.dist-info/licenses/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
