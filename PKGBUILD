# Maintainer: Alex Hirzel <alex at hirzel period us>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-pyinstrument
_name="${pkgname#python-}"
pkgver=4.4.0
pkgrel=1
pkgdesc="Call stack profiler for Python"
arch=('x86_64' 'aarch64')
url="https://github.com/joerick/pyinstrument"
license=('BSD')
depends=('python>=3.7')
makedepends=('ipython' 'python-build' 'python-django' 'python-installer' 'python-setuptools' 'python-typing_extensions' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('be34a2e8118c14a616a64538e02430d9099d5d67d8a370f2888e4ac71e52bbb7')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_name-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
