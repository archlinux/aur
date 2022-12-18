# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

pkgname=samarium
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="A dynamic, interpreted language that is transpiled to Python"
arch=(any)
url="https://github.com/samarium-lang/Samarium"
license=('MIT')
depends=('python>=3.9' 'python-dahlia' 'python-crossandra')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=()
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('07588ba3a0d7c1c4f99966f099b8fafb456623b0e6733088d715132bca2fb910')

build() {
	cd ..
	[ -f .gitignore ] && mv .gitignore .gitignore.tmp

	pushd "$srcdir/$pkgname-$pkgver"
	python -m build --wheel --no-isolation

	popd
	[ -f .gitignore.tmp ] && mv .gitignore.tmp .gitignore || true
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
