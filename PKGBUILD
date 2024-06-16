# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=crossandra
pkgname="python-$_pkgname"
pkgver=2.2.1
pkgrel=1
pkgdesc='A simple tokenizer operating on enums with a decent amount of configuration'
arch=(x86_64)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.8' 'python-result')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'mypy')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('87fbf5370e4943ef37bbdc4cfa3e0ecf52867a2ed9cada4323c3a28b92026226a0c43a0ceeaf02da0f2dd7f6ff798d3c0642c07b43105a88a98c22e9158af4d6')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i 's/result \~=/result >=/' pyproject.toml
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
