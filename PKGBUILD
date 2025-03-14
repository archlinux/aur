# sudacode <suda@sudacode.com>
pkgname=mokuro
_name=mokuro
pkgver=0.2.2
pkgrel=1
pkgdesc="Read Japanese manga inside browser with selectable text. "
arch=('x86_64')
url="https://github.com/kha-white/mokuro"
license=('GPL-3.0')
depends=(
	'python>=3.6'
	'python-opencv'
	'python-torch-summary'
	'python-shapely'
	'python-yattag'
	'python-tqdm'
	'python-loguru'
	'python-scipy'
	'python-pytorch'
	'python-torchvision'
	'python-pyclipper'
	'python-fire'
	'python-natsort'
	'python-numpy'
	'python-pillow>=7.1.2'
	'python-transformers>=4.25.0'
	'python-safetensors>=0.4.1'
	'python-manga-ocr'
)
makedepends=('python-pip' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('7534d32d1e25ac7be8a828d328be9aceb06a05d3c3392721120410f4cff02fe3')

check() {
	cd "$_name-$pkgver"
	pytest -o addopts=""
}

build() {
	cd "$_name-$pkgver"
	python -m pip wheel . --no-deps --wheel-dir dist
}

package() {
	cd "$_name-$pkgver"
	python -m pip install --no-deps --root="$pkgdir" --prefix=/usr --ignore-installed .
}
