# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-bump-my-version
_name=$( echo ${pkgname#python-} | tr '-' '_' )
pkgver=0.21.0
pkgrel=0
pkgdesc='A small command line tool to simplify releasing software by updating all version strings'
arch=(any)
url=https://github.com/callowayproject/bump-my-version
license=(MIT)
depends=(
    python
    python-click
    python-pydantic
    python-pydantic-settings
    python-questionary
    python-rich
    python-rich-click
    python-tomlkit
    python-wcmatch
)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://github.com/callowayproject/bump-my-version/releases/download/${pkgver}/${_name}-${pkgver}.tar.gz)
sha256sums=('c3f1a31e32345679b517cbba99a0875457ee45d7ba6189fcd2a74d3ddae41515')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
