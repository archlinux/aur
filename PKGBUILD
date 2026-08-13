# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-option-menu
pkgname=python-$_name
pkgver=0.4.0
pkgrel=1
pkgdesc='Navigation/option menu component for Streamlit apps'
arch=(any)
url='https://github.com/victoryhb/streamlit-option-menu'
# LICENSE is MIT text, though upstream left the PyPA sample-project boilerplate
# ("Copyright (c) 2018 The Python Packaging Authority") in the header.
license=(MIT)
depends=(
  python
  python-streamlit
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# NOTE: this sdist keeps HYPHENS in the tarball and directory name, unlike most
# other streamlit components which use the underscored form. Do not "normalise"
# this to ${_name//-/_} -- that URL 404s.
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('48ec69d59e547fa2fa4bfae001620df8af56a80de2f765ddbb9fcbfb84017129')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
