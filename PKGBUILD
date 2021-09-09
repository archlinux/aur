# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=google-crc32c

pkgname=python-google-crc32c
pkgver=1.1.5
pkgrel=1
pkgdesc="A python wrapper of the C library 'Google CRC32C'"
pkgdesc="Wraps Google's CRC32C library into a Python wrapper"
arch=('any')
url="https://github.com/googleapis/python-crc32c"
license=('APACHE')
depends=('python>=3.6')
makedepends=('python-setuptools')
optdepends=('google-crc32c: use C extension instead of pure Python implementation (requires rebuild)')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0d58387206b44fc820ac9cddb367addaa51ae706694f7d15c43abc55bf6a09c1')

build() {
  # Google CRC32C package is now here https://aur.archlinux.org/packages/google-crc32c/ .
  # But its install prefix is `/usr/local`.
  # To use it you need to change its install prefix to `/usr`.

	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
