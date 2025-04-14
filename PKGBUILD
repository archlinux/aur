# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=2.2.0
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache-2.0')
depends=(python python-importlib-metadata)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('2fa2d3db0e582d1e03b1c50ec7eaa5268f8ff7efde05ed5a09a4386ed7fb2043b8e3729fdd1c4b519523f114cb809ad01146a1400844ad122433d6cd35b707ee')

build() {
  cd $_name-$pkgver
  # We add the LICENSE file later
  sed -i '/Apache-2.0/d' "${srcdir}/fake-useragent-${pkgver}/pyproject.toml"
  sed -i 's/setuptools>=77.0/setuptools/g' "${srcdir}/fake-useragent-${pkgver}/pyproject.toml"  
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
