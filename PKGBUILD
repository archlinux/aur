# Maintainer: Corentin Cadiou <contact@cphyc.me>

pkgname=python-cmyt
_module_name=cmyt
pkgver=1.2.0
pkgrel=2
pkgdesc="A collection of Matplotlib colormaps from the yt project."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=(python-colorspacious python-matplotlib python-more-itertools python-numpy)
makedepends=(python-build python-installer python-wheel)
optdepends=()
options=(!emptydirs)
source=(
    "https://pypi.io/packages/source/c/${_module_name}/${_module_name}-${pkgver}.tar.gz"
    "LICENSE"
)
sha256sums=('3cd6a6dbdbf29308bc432604ae9a55e874c8502fc218057195c354a74c82a07b'
            '6e13969520b08a454eed4e15bef8926babca14ab65f4f9936c9adc1860c00e1d')

build() {
  cd "$srcdir/${_module_name}-$pkgver"
  rm -rf tests/
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$srcdir/${_module_name}-$pkgver"
  pytest
}
