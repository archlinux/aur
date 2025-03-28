# Maintainer KiWi42 <pullthisplug dash aur at yahoo dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Alexander Bruegmann <mail[at]abruegmann[dot]eu>

pkgname=python-pytenable
_pkg=pyTenable
pkgver=1.7.4
pkgrel=1
pkgdesc="Python library to interface into Tenable's products and applications"
arch=('any')
url="https://github.com/tenable/pyTenable"
license=('MIT')
depends=(
	'python-box'
	'python-cryptography'
	'python-dateutil'
	'python-defusedxml'
	'python-graphql-core'
	'python-marshmallow'
	'python-pydantic'
	'python-pydantic-extra-types'
	'python-requests'
	'python-requests-toolbelt'
	'python-restfly'
	'python-semver'
	'python-typing_extensions'
	)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	)
optdepends=('python-docker: Docker support')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4c546852b690ce20d292e065994cc40bb72fd2cefbda584102aa8622012eb78d')


build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
	# make -C docs man
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	# install -Dvm644 docs/_build/man/pytenable.1 -t "$pkgdir/usr/share/man/man1/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
