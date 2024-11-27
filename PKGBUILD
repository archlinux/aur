# Maintainer: getzze <getzze at gmail dot com>

pkgname=python-bump-my-version
_name=$( echo ${pkgname#python-} | tr '-' '_' )
pkgver=0.28.1
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
sha256sums=('e608def5191baf505b6cde88bd679a0a95fc4cfeace4247adb60ac0f8a7e57ee')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
