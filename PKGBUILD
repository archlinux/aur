# Maintainer: redponike <proton (dot) me>
# Contributor: sgar < swhaat at github >
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgname=python-streamlit
_pkgname=${pkgname#python-}
pkgver=1.44.0
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
sha512sums=('ae31dd3bb7063551f358d6463fe9088a70b5c2ad40e5b54dfaa15eef5ce2c75ddc328cafc4c5f0bd8bb437217d780ac4f9444fa0911f9aecb1cc8eb69afbc1a4')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -vf "${pkgdir}/usr/bin/streamlit.cmd"
}
