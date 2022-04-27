# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: a821
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-versioneer-518
_name=${pkgname#python-}
pkgver=0.19
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://github.com/python-versioneer/python-versioneer"
license=('custom:Public Domain')
arch=(any)
depends=('python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-cx-freeze: Executable generation support')
provides=("python-versioneer=$pkgver")
conflicts=('python-versioneer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a287608997415f45401849d1227a42bb41b80a6e4a7da5776666f85ce6faec41')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim: set ts=4 sw=4 et:
