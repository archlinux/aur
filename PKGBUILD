# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-shippinglabel
pkgver=2.3.0
pkgrel=1
pkgdesc='Utilities for handling Python packages'
arch=(any)
url='https://shippinglabel.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-apeye
  python-dist-meta
  python-dom-toml
  python-domdf-python-tools
  python-packaging
  python-platformdirs
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-hatchling
  python-hatch-requirements-txt
)
#checkdepends=()
#optdepends=()
source=("$pkgname::git+https://github.com/domdfcoding/shippinglabel#tag=v$pkgver")
sha512sums=('45d25d5e62bc041dc86d9971aafe3ee6489fe7af10884e44359e52e0c15111186367ab2bbad8b4dc4fd90ef24974759dfa51bbbeff3bd60b7cb8296d0d294c19')
b2sums=('1f90a5d1a3523783937f0805185f3ca681251cad42b495ee6c58bb744c3147378745b152335e20dd1d24a55d7b7e4933a1228d9f133296b43423f37c435f5202')

prepare() {
  cd "$pkgname"

  # remove version constraints
  sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
