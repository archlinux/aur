pkgname=python-pyfatfs
_name=${pkgname#python-}
pkgver=1.0.5
pkgrel=1
pkgdesc="Python based FAT12/FAT16/FAT32 implementation with VFAT support"
arch=($CARCH)
license=('MIT')
url='https://github.com/nathanhi/pyfatfs'
depends=('python>=3.6' 'python-fs')
makedepends=('python-setuptools' 'python-pip')
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e49ea062119fdf6198c7bbbcfe08589d8919e34ac21f5f604d0ed8b5c444972d')
sha512sums=('a4597fa3b33444050da462e318b6425fc1967cef67ea7da3461f825132f4d46a5a86bbad618c6696a058578b6e523aba07d26d9fe3025a427a7b9bd582d6da21')

build() {
	cd ${_name}-${pkgver}
	python setup.py build
}

package() {
	cd ${_name}-${pkgver}
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
