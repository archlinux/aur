# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-domdf-python-tools
pkgver=3.10.0
pkgrel=1
pkgdesc='Helpful functions for Python'
arch=(any)
url='https://domdf-python-tools.readthedocs.io'
license=(MIT)
depends=(
  python
  python-natsort
  python-typing_extensions
  python-pandas
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
source=("$pkgname::git+https://github.com/domdfcoding/domdf_python_tools#tag=v$pkgver")
sha512sums=('ddcba2085564e58cd9d81a5e116e78fdc970b9d5828d5a31280caf437619a21382895b319309c4ce278fd8d91aa903a9fce6cbcfa06593e3b4035e63015165b1')
b2sums=('8e8a45e096586dee6888d41c78370238464e5a8c39d1e8470d14dd2273fb04cde10940c452d4f2029f1e0aaa02012b4f9692b4d9f69bd30c28825be1d18d8ef5')

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
