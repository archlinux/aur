# Maintainer: loathingkernel <username at gmail dot com>

pkgname=python-text2digits
_pyname=${pkgname#python-}
pkgver=0.1.0
pkgrel=1
pkgdesc='A small library to convert text numbers to digits in a string'
arch=(x86_64)
url="https://github.com/ShailChoksi/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest
              python-hypothesis)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('a01d8dc8d57179d888ba589df40e02730f3bf2dd892ab22c37538e4799728bb2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver"
	python -m pytest -rsx
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
