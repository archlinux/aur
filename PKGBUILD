# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=python-nestedtext
_pkg="${pkgname#python-}"
pkgver=3.6
pkgrel=1
pkgdesc='Human readable and writable data interchange format'
arch=('any')
license=('MIT')
url='https://github.com/KenKundert/nestedtext'
depends=('python-inform')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('8837596bdb5936b05ead4517713dc67f8118760ef59e58777475d4a8dd20cbac')

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
