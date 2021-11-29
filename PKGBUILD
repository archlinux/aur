# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=pyinstrument

pkgname=python-pyinstrument
pkgver=4.1.1
pkgrel=1
pkgdesc="Call stack profiler for Python"
arch=('x86_64')
url="https://github.com/joerick/pyinstrument"
license=('BSD')
depends=('python>=3.7' 'python-pyinstrument_cext')
makedepends=('python-setuptools')
# checkdepends=(
# 	'python-pytest'
# 	'python-pytest-asyncio'
# 	'python-pytest-runner'
# 	'python-flaky'
# 	'python-trio'
# 	'python-django'
# 	'python-sphinx'
# 	'python-myst-parser>=0.15.1'
# 	'python-greenlet')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1dc2791d2cd2fd3459cb55010004a5cc2a9a8b4625a0cbea45a4b1aebbe2c3a2')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

# check() {
# 	cd "$_name-$pkgver"
# 	local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
# 	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python setup.py pytest
# }

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
