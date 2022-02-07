# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-pyamdgpuinfo
_name=${pkgname#python-}
pkgver=2.1.2
pkgrel=1
pkgdesc="AMD GPU stats"
arch=('x86_64')
url="https://github.com/mark9064/pyamdgpuinfo"
license=('GPL3')
depends=('python' 'libdrm')
makedepends=(
	'python-setuptools'
	'cython'
	'python-build'
	'python-install'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('706d9f09f8d97656bae642ac87f958d7977bbe751efe1350f3fcf2a24966026a')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
