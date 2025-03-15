# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-surya-ocr"
_name="surya_ocr"
pkgver=0.13.0
pkgrel=1
pkgdesc="OCR, layout analysis, reading order, table recognition in 90+ languages"
arch=('any')
url="https://pypi.org/project/surya-ocr/"
license=('GPL3')
provides=(python-surya)
depends=(
  python-pytorch python-opencv
  #AUR
  python-chex python-optax python-flax python-safetensors python-transformers
  )
optdepends=(python-pytorch-cuda python-pytorch-rocm)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('93b866ced75d9599dbbb0f746498f114d10f5063f588013a27e5192b4d307cc9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
