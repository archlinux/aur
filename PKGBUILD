# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

## GPG key: https://github.com/trevorbaca.gpg

pkgname=python-abjad-ext-nauert
pkgver=3.10
pkgrel=1
pkgdesc="Abjad quantization extension, based on Paul Nauert's Q-Grids"
arch=('any')
url="https://github.com/abjad/abjad-ext-nauert"
license=('MIT')
groups=('abjad')
depends=("python-abjad>=$pkgver")
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('B76E156E7824B5040027E7C6205943F230B622B9') ## Trevor Baca

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

## tests segfault
# check() {
# 	cd "abjad-ext-nauert-$pkgver"
# 	pytest -x -c /dev/null
# }

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/abjad_ext_nauert-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
