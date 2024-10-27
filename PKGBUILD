# Maintainer: Nikos Toutoutzoglou <nikos dot toutou at protonmail dot com>

pkgname=python-iptvtools
_name=iptvtools
pkgver=0.2.12
pkgrel=1
pkgdesc="Provides iptv-filter script tool to maintain IPTV lists."
arch=('any')
url="https://github.com/huxuan/iptvtools"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-setuptools'
  'python-setuptools-scm'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-sphinx'
  'python-sphinxcontrib-programoutput'
  'python-wheel'
)
optdepends=('ffmpeg: filter by stream information, e.g., resolution/height')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3f35c67989b1ec822839add3c1e646b7e8eb0975ed2b04058ba697fdde500ccd')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
