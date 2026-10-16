# Maintainer: Corentin Cadiou <contact@cphyc.me>

pkgname=python-cmyt
_module_name=cmyt
pkgver=2.0.4
pkgrel=1
pkgdesc="A collection of Matplotlib colormaps from the yt project."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=(python-colorspacious python-matplotlib python-more-itertools python-numpy)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=()
options=(!emptydirs)
source=(
    "https://pypi.io/packages/source/c/${_module_name}/${_module_name}-${pkgver}.tar.gz"
    "LICENSE"
)
sha256sums=('3cb83424adf95337840d9dd6eef5f0e2f6d53e9618cd11a2cb31218227e40b27'
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

