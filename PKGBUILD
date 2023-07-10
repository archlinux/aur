# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.1.0
pkgrel=1
pkgdesc="Quickly swap between screen shaders in Hyprland"
arch=('any')
url="https://github.com/loqusion/hyprshade"
license=('MIT')
_py_deps=(
	more-itertools
	typer
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-{build,installer})
provides=($pkgname)
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9254a9d60d1d2443646bac5c9db04640d9f58210b9616350a592f688371831df')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
