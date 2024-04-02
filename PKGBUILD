# Contributor: a821 mail de
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-unit-convert
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Convert units to different quantities"
arch=('any')
url="https://github.com/Peter92/unit-convert"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a9ba2af984a28f0bf55dfcb1f935eb9b6a0d9f94de650cf6b6b623f420802725')

prepare() {
	cd "$_name-$pkgver"
	sed -i 's/-file/_file/' setup.cfg # fix deprecation warning
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
