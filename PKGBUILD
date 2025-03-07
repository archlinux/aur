# Maintainer: redponike <proton (dot) me>
# Contributor: sgar < swhaat at github >
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

_pkgname=streamlit
pkgname=python-streamlit
pkgver=1.43.0
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
sha512sums=('c700e6ca1d2cb77133757eb20569cc8312755cb694c4c6ab404a691f0c4fe4def038d14d51503d90dc82fc49b067ca43e97205699c7ef5ee7e489031c1c68243')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
