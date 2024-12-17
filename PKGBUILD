# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-domdf-python-tools
pkgver=3.9.0
pkgrel=1
pkgdesc='Helpful functions for Python'
arch=('any')
url='https://domdf-python-tools.readthedocs.io'
license=('MIT')
depends=(
  'python'
  'python-natsort'
  'python-typing_extensions'
  'python-pandas'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$pkgname::git+https://github.com/domdfcoding/domdf_python_tools#tag=v$pkgver")
sha512sums=('9fbd1748abba5fdc07582338c1c03d56537159243043b170825501fcf3e37dae16e99c7eb29fac597e1a4af22b39af02e290619e6ada82ec53028770d6110d52')
b2sums=('3160e20c8904ba069c7661fd8163f1d30fcf8909d359f0f72d130f10592b0bac5b79d0dca897dcf28eab65cb39357ef363ea39c8add469cfcd5d268863e83056')

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
