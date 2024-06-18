# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=samarium
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc='A dynamic, interpreted language that is transpiled to Python'
arch=(any)
url='https://github.com/samarium-lang/Samarium'
license=('MIT')
depends=('python>=3.9' 'python-dahlia>=3.0.0' 'python-crossandra>=2.2.1')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'git')
checkdepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('c1b3e40f162ac0e70316a3a0b7cfe588756e36098a0a851b7ceb29d5cf3fe2ce8e447804d398390655a7866b5b7741a468fa005a26f6ab355fd3f3059bda7b06')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	git init -b master  # prevent poetry from looking for parent .gitignores
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
