# Maintainer: qexat <contact@qexat.com>

_pkgname=babi
pkgname=$_pkgname-git
pkgver=v1.6.1.r7.ge199e92
pkgrel=1
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi' 'babi-grammars' 'python-identify')
makedepends=('python-setuptools')
provides=('babi')
conflicts=('babi' 'babi-git')
source=("${pkgname}"::git+https://github.com/asottile/babi.git)
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
