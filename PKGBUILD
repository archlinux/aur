# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-mpris_server
_name=${pkgname#python-}
pkgver=0.2.16
pkgrel=1
pkgdesc="Integrate MPRIS Media Player support into your app"
arch=('any')
url="https://github.com/alexdelorenzo/mpris_server"
license=('AGPL3')
depends=('python-gobject' 'python-pydbus' 'python-unidecode' 'python-emoji=0.6.0')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0fa686e1a3b3f8b039ffe9eb5b4cacaea97dc78c75ca9c7ebbb5266064ccde7e')

prepare() {
	cd "$_name-$pkgver"

	# Relax requirements
	sed -i 's/unidecode==/unidecode>=/g' requirements.txt
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
