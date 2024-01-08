# Maintainer: Grafcube <grafcube at disroot dot org>

_lark_whl=lark-1.1.5-py3-none-any.whl

_pkgname=gdtoolkit
pkgname=python-${_pkgname}
pkgver=4.2.2
pkgrel=1
pkgdesc='Independent set of tools for working with GDScript - parser, linter and formatter'
arch=(any)
url='https://github.com/Scony/godot-gdscript-toolkit'
license=(MIT)
depends=(python python-setuptools python-docopt-ng python-yaml python-radon python-regex python-six)
makedepends=(python-installer)
provides=()
conflicts=(python-lark-parser)
source=(
	"https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"https://files.pythonhosted.org/packages/py3/l/lark/${_lark_whl}"
)
sha256sums=('2f85fde94b9dceb5d602361c2a00c75e15ae3145d84f3971f34f7479de4eec39'
            '8476f9903e93fbde4f6c327f74d79e9b4bd0ed9294c5dfa3164ab8c581b5de2a')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	python -m installer --destdir="$pkgdir" $_lark_whl
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
