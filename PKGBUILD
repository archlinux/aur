# Maintainer: Your Name <youremail@example.com>
pkgname=python-manga-ocr
_pkgname=manga_ocr
pkgver=0.1.14
pkgrel=1
pkgdesc="A tool for extracting text from manga images using OCR"
arch=('any')
url="https://github.com/kha-white/manga-ocr"
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-installer' 'python-wheel')
depends=(
	'python'
	'python-fire'
	'python-fugashi'
	'python-jaconv'
	'python-loguru'
	'python-numpy'
	'python-pillow'
	'python-pyperclip'
	'python-pytorch'
	'python-transformers'
	'python-unidic-lite'
)
optdepends=('python-pytorch: GPU acceleration')
source=("https://github.com/kha-white/manga_ocr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7d73bbf482cbefb6f91ff3c628a3131d6c7dc863612539fe5d03a4b7d640643')

build() {
	cd "${_pkgname//_/-}-$pkgver"
	python -m pip wheel . --no-deps --wheel-dir dist
}

package() {
	cd "${_pkgname//_/-}-$pkgver"
	python -m pip install --no-deps --root="$pkgdir" --prefix=/usr --ignore-installed .
	# Move the assets folder to the Python module directory
	install -dm755 "$pkgdir/usr/lib/python3.13/site-packages/manga_ocr/"
	cp -r assets "$pkgdir/usr/lib/python3.13/site-packages/manga_ocr/"
	cp "$pkgdir/usr/lib/python3.13/site-packages/manga_ocr/assets/examples/00.jpg" "$pkgdir/usr/lib/python3.13/site-packages/manga_ocr/assets/example.jpg"
}
