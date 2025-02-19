# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-surya-ocr"
_name="surya_ocr"
pkgver=0.11.1
pkgrel=1
pkgdesc="OCR, layout analysis, reading order, table recognition in 90+ languages"
arch=('any')
url="https://pypi.org/project/surya/"
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
sha256sums=('1de05f1b00d0a9c4c6e737b51d9192161f1dd48a3cf76437e56a33a390bd2d26')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
