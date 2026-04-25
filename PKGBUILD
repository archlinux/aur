# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=python-tesserocr
_name=${pkgname#python-}
pkgver=2.10.0
pkgrel=1
pkgdesc="A simple, Pillow-friendly, Python wrapper around tesseract-ocr API using Cython"
arch=('x86_64')
url="https://github.com/sirfz/tesserocr"
license=('MIT')
depends=(
	'leptonica'
	'python'
	'tesseract'
	'python-cysignals'
)
makedepends=(
	'cython'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=('python-pillow')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('fc6dae77ae37ca5ac47e61c44726b175429e8c4494ce1d4d8ca7822008d739ff6b52d5971a1555e8b6b6f0bb99dbbdbaa71a91a22d454e3bd8f4f6a9e462112e')

prepare() {
	cd "$_name-$pkgver"
	sed -i 's/Cython>=3.0.0,<3.2.0/Cython>=3.0.0/' setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
