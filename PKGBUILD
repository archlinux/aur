# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.5.8
pkgrel=1
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL3')
depends=('python-aiofile' 'python-anyio')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
        'requirements.txt')
#source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d45cfacb01a0de619c5ff1b69ccbd9d4721fb58ee5a8b7bab163976fef42d1f'
            '0bc99fef1d99908d4bd35a9bc81345124f1ebf4a7f12ac93327beac7cf7dca2d')

prepare() {
	cp requirements.txt "$_name-$pkgver"
}

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
