# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=samarium
pkgver=0.6.2
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
sha512sums=('e3d176db33cb4f9821afdc031c96524f0e1e0e018469d8f5d979596430800f7b6cf82107e9df5dd53747419f7fbbfaf9463029181785d63a8ac55d64a05059ce')

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
