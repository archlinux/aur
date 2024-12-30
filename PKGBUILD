# Maintainer: qexat <contact@qexat.com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi
pkgver=1.6.0
pkgrel=1
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi>=0.0.18' 'babi-grammars' 'python-identify')
makedepends=('python-setuptools' 'python-build')
provides=('babi')
conflicts=('babi' 'babi-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ae18d95e227a7f8a52613aac909522f0f0ea0fa217a944f9df1c3d09e6bc9a9d')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	# TODO: use pip?
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
