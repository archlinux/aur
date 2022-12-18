# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=dahlia
pkgname=python-$_pkgname
pkgver=2.1.3
pkgrel=1
epoch=
pkgdesc='A simple text formatting package, inspired by the game Minecraft.'
arch=(any)
url='https://github.com/trag1c/Dahlia'
license=('MIT')
depends=('python>=3.8' 'python-argparse')
makedepends=('python-build' 'python-installer' 'python-poetry')
checkdepends=()
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
)
sha256sums=('b83e67b15bbf23ca063fd3ad58b1dd0fd0255defbe75e29dd19a4fb552ef48e7')

build() {
	cd ..
	[ -f .gitignore ] && mv .gitignore .gitignore.tmp

	pushd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation

	popd
	[ -f .gitignore.tmp ] && mv .gitignore.tmp .gitignore || true
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
