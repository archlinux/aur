# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-rmakers
pkgver=3.5
pkgrel=1
pkgdesc='Abjad rhythm-maker extension'
arch=('any')
url="https://github.com/abjad/abjad-ext-rmakers"
license=('MIT')
groups=('abjad')
depends=("python-abjad>=$pkgver")
makedepends=(
	'git'
	'python-setuptools'
	'python-build'
	'python-install'
	'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('B76E156E7824B5040027E7C6205943F230B622B9')

build() {
	cd "$pkgname"
	python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
# 	cd "$pkgname"
# 	pytest -x -c /dev/null abjadext
# }

package() {
	cd "$pkgname"
	export PYTHONHASHSEED=0
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
