# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-tuitorial
_pkgname=tuitorial
pkgver=0.16.0
pkgrel=1
pkgdesc="A tutorial presentation tool using Textual, with syntax highlighting"
arch=('any')
url="https://github.com/basnijholt/tuitorial"
license=('MIT')
depends=('python' 'python-chardet' 'python-pyfiglet' 'python-yaml' 'python-rich' 'python-textual' 'python-watchfiles')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-versioningit' 'git')
_tag="v0.16.0"
source=("$_pkgname::git+https://github.com/basnijholt/tuitorial.git#tag=$_tag")
sha256sums=('a4db23840d3b1853b2b3914cb8b9f1a27da3151ca2c229ca6ffc08f7645259c5')

build() {
	cd "$_pkgname"
	rm -rf dist
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
