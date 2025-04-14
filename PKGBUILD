# Maintainer: redponike <proton (dot) me>
# Contributor: sgar < swhaat at github >
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgname=python-streamlit
_pkgname=${pkgname#python-}
pkgver=1.44.1
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
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e8c03d19a9ef0e6f3e99af3b7ddc75f7898f90f414de61486b417682ddbc58485f7e9b722c1749423bdff61095ba5d2fc2caaae06bec1e8650e623d68452467b')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
