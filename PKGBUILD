# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=python-nestedtext
_pkg="${pkgname#python-}"
pkgver=3.5
pkgrel=1
pkgdesc='Human readable and writable data interchange format'
arch=('any')
license=('MIT')
url='https://github.com/KenKundert/nestedtext'
depends=('python-inform')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9beced9cb39e5e0d05148393f5279b0e1cc4868a8bb11800dc03dd07a5e2c3d7')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# eof
