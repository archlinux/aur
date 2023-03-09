# Maintainer: MithicSpirit <rpc01234 at gmail dot com>

_pkgname=crossandra
pkgname="python-$_pkgname"
pkgver=1.3.0
pkgrel=1
pkgdesc='A simple tokenizer operating on enums with a decent amount of configuration'
arch=(x86_64)
url="https://github.com/trag1c/$_pkgname"
license=('MIT')
depends=('python>=3.9' 'python-result')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'mypy')
checkdepends=()
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('d7614b82c91b4e9b5b633a4638807d5b55fb66ad23a5a202397a91cc85f9dc6d71158ff0df8477f9c25ca5bdc1a29d9a3940fc6d92f48aa9cae28aa392a57d65')

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
