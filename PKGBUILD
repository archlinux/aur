# Maintainer: Jonas Bengtsson <jonas@bengtsson.cc>

pkgname=anidb-mv
_name=${pkgname//-/_}
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line client for AniDB"
arch=(any)
url="https://github.com/ljb/anidb-mv"
license=('GPL-3.0-or-later')
depends=(python python-pycryptodomex)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('974b8a5e21df7af3023963d7a9ac97d025aab13e6278998a71058cc5482abe23')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    pytest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
