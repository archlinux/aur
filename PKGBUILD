# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi
pkgver=1.5.7
pkgrel=5
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi>=0.0.18' 'babi-grammars' 'python-identify')
makedepends=('python-setuptools' 'python-build')
provides=('babi')
conflicts=('babi' 'babi-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d1eecf63455c3c609436c8d0cecc0468d7c49c1a70f64adf2c3ca687eb80071b')

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

