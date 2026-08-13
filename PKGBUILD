# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-echarts
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc='Display ECharts and pyecharts charts in Streamlit apps'
arch=(any)
url='https://github.com/andfanilo/streamlit-echarts'
license=(MIT)
depends=(
  python
  python-streamlit
)
# pyecharts is an upstream extra, not a hard requirement: st_echarts() takes plain
# option dicts, and only st_pyecharts() needs it.
optdepends=('python-pyecharts: render pyecharts objects via st_pyecharts()')
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('831fffa4daba03b31afaf560aa5e5947b021ccf714e41c456c82301f9af06089')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
