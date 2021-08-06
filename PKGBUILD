# Maintainer: fkobayashi <see name left ＠ 数学 (but in english) dot ubc.ca
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=plom
pkgver=0.5.16
pkgrel=2
pkgdesc='Paperless open marking'
arch=(any)
url="https://gitlab.com/$pkgname/$pkgname"
license=(AGPL3)
_pydeps=(aiohttp
         appdirs
         cffi
         imutils
         jpegtran-cffi
         lapsolver
         numpy
         opencv
         pandas
         passlib
         peewee
         pillow
         pymupdf
         pypng
         pyqrcode
         pyqt5
         requests
         requests-toolbelt
         scikit-learn
         toml
         tqdm
         weasyprint)
depends=(opencv
         python
         "${_pydeps[@]/#/python-}"
         pyzbar)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('efe3171afd9d254c3b52b8cde74edb3cc219c7b96d11c10a94dce05f8176e93e')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
    pytest -l --pyargs "$pkgname" ||:
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
