# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>

pkgname=globus-cli
pkgver=3.8.0
pkgrel=1
pkgdesc='CLI for Globus'
arch=('any')
url='https://github.com/globus/globus-cli'
license=('Apache')
depends=(
	'python>=3.7'
	'python-globus-sdk=3.11.0'
	'python-click'
	'python-jmespath'
	'python-requests'
	'python-cryptography')
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
replaces=('python-globus-cli')
changelog=changelog.adoc
source=("$pkgname::git+$url#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('FC694E40DC03A8B702D96372CF7E843C41E814C9')

prepare() {
	cd "$pkgname"
	sed -i '/jmespath/s/==/>=/' setup.py
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
