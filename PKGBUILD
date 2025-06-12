# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Felix Barz <skycoder42.de@gmx.de>

pkgname=qdep
pkgver=1.1.1
pkgrel=2
pkgdesc="A dependency management tool for qmake based projects"
arch=('any')
url="https://github.com/Skycoder42/qdep"
license=('BSD-3-Clause')
install="$pkgname.install"
depends=('qt5-base' 'python-argcomplete' 'python-lockfile' 'python-appdirs')
optdepends=('qt5-tools: Needed for lupdate to generate qdep translations')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b42a8f934d1114e6d7b32c78c513b153fe15fd0e7eb55872af0726ca6514dcec')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
