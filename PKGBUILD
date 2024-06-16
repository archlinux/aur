# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=dahlia
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc='A simple text formatting package, inspired by the game Minecraft.'
arch=(any)
url='https://github.com/trag1c/Dahlia'
license=('MIT')
depends=('python>=3.8')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'git')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('ec2c2bee242c40cb458429c8d7a96c664aa501ded3ca93f4977914b8a4e40eb8597b1a24f059c0ad0b1ca37b955c1f7515cb33dc5defb917bcc5e835eafe9f8a')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	git init -b master  # prevent poetry from looking for parent .gitignores
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
