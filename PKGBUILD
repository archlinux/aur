# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-proto-plus
_name=proto-plus
pkgver=1.19.0
pkgrel=1
pkgdesc="A wrapper around protocol buffers."
arch=('any')
url="https://github.com/googleapis/proto-plus-python"
license=('Apache')
optdepends=('python-google-api-core: Testing')
makedepends=('python'
	'python-setuptools')
depends=("python-protobuf")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('8f5fa148e464de288849ee96381f5172419c45db51036b80734a4a7e82bcfb4e88a4058acfcce815a3c6c92079a09871cc3ebe24146d4be443647e6d8cf31ccb')

build() {
	cd "$srcdir/$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
