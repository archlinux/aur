# Maintainer: Corentin Cadiou <contact@cphyc.me>

pkgname=python-cmyt
_module_name=cmyt
pkgver=2.0.1
pkgrel=1
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
sha256sums=('a24c5cf765458fa8ed6b70c37d9531cdd8ae79ae96f916d26a3c3c169b18346e'
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
