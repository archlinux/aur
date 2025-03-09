# Maintainer: redponike <proton (dot) me>
# Contributor: sgar < swhaat at github >
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.43.1
pkgrel=1
pkgdesc='A faster way to build and share data apps'
arch=('any')
url='https://streamlit.io'
license=('Apache-2.0')
depends=(
  python-altair
  python-blinker
  python-cachetools
  python-click
  python-numpy
  python-packaging
  python-pandas
  python-pillow
  python-protobuf
  python-pyarrow
  python-requests
  python-tenacity
  python-toml
  python-typing_extensions
  python-watchdog
)
makedepends=(
  python-build python-installer python-wheel
)

source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
)
sha512sums=('56f251e29350fac0fb354a0671ce5b27de31a8e0229254e3d3f54e2674b4b4143d9c0a0dfc274483384fc56ec40ae527f2995def659b4909e30bff1ed384b943')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
