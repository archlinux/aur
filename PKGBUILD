# Maintainer: Jeremy MountainJohnson <jay@jskier.com>

_name=streamlit-extras
pkgname=python-$_name
pkgver=1.6.0
pkgrel=1
pkgdesc='Collection of extra Streamlit components: metric cards, badges, colored headers, mentions'
arch=(any)
url='https://github.com/arnaudmiribel/streamlit-extras'
license=(Apache-2.0)
# Upstream declares only plotly and streamlit. Everything else the package imports
# unguarded (pandas, numpy, altair, pillow, requests, packaging, typing_extensions)
# already arrives with python-streamlit, so it is not repeated here.
depends=(
  python
  python-plotly
  python-streamlit
)
# These three are genuinely optional: each backs one submodule, each import is
# try-guarded, and sigma_graph raises a StreamlitAPIException telling the user to
# install networkx rather than crashing.
optdepends=(
  'python-networkx: sigma_graph() layout algorithms and NetworkX graph input'
  'python-diagrams: diagrams() component'
  'python-great-tables: great_tables() component'
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('d75bfabd2be35f1fba6bce3935d1c446cfcfbe03123478df1b5ba4a02a7c49c0')

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
