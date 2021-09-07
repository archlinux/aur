# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

_name=pyinstrument

pkgname=python-pyinstrument
pkgver=4.0.3
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
sha256sums=('08caf41d21ae8f24afe79c664a34af1ed1e17aa5d4441cd9b1dc15f87bbbac95')

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
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
